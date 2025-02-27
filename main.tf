# Placeholder for Terraform code

resource "tfe_project" "project" {
  name         = var.project_name
  organization = data.tfe_organization.org.name
  lifecycle {
    ignore_changes = [name, organization]
  }
}

resource "tfe_team_project_access" "admin" {
  access     = var.team_project_access
  team_id    = data.tfe_team.team.id
  project_id = tfe_project.project.id
}

resource "tfe_workspace" "workspaces" {
  for_each     = var.workspaces
  name         = each.value.name
  organization = data.tfe_organization.org.name
  project_id   = tfe_project.project.id

  vcs_repo {
    identifier     = each.value.vcs_repo_identifier
    branch         = each.value.vcs_branch
    oauth_token_id = var.vcs_oauth_token_id
  }
}

resource "tfe_workspace_settings" "workspace_settings" {
  for_each       = var.workspaces
  workspace_id   = tfe_workspace.workspaces[each.key].id
  execution_mode = each.value.execution_mode
}

resource "tfe_variable" "workspace_variables" {
  for_each = merge([
    for ws_name, ws in var.workspaces : {
      for var_name, v in ws.variables : "${ws_name}.${var_name}" => {
        workspace_id = tfe_workspace.workspaces[ws_name].id
        key          = v.key
        value        = v.value
        category     = v.category
        description  = lookup(v, "description", "")
      }
    } if ws.variables != null
  ]...)

  workspace_id = each.value.workspace_id
  key          = each.value.key
  value        = each.value.value
  category     = each.value.category
  description  = each.value.description
}