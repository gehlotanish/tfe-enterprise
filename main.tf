# Placeholder for Terraform code


resource "tfe_project" "project" {
  name         = var.project_name
  organization = data.tfe_organization.org.name
  lifecycle {
    ignore_changes = [name, organization]
  }
}

resource "tfe_workspace" "workspace" {
  name         = var.workspace_name
  organization = data.tfe_organization.org.name
  project_id   = local.project_id

  vcs_repo {
    identifier     = var.vcs_repo_identifier
    branch         = var.vcs_branch
    oauth_token_id = "ot-DnwNkwzxgpkt3G3o"
  }
}

resource "tfe_team_project_access" "admin" {
  access     = var.team_project_access
  team_id    = data.tfe_team.team.id
  project_id = local.project_id
}

resource "tfe_workspace_settings" "workspace_settings" {
  workspace_id   = tfe_workspace.workspace.id
  execution_mode = var.execution_mode
}

resource "tfe_variable" "workspace_variables" {
  for_each = var.workspace_variables

  key          = each.key
  value        = each.value.value
  category     = each.value.category
  workspace_id = tfe_workspace.workspace.id
  description  = each.value.description
}