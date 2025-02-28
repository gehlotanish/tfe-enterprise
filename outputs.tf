# # Placeholder for Terraform code
# # Should contain all output variables of modules

output "project_id" {
  description = "The ID of the created project"
  value       = tfe_project.project.id
}

output "workspaces" {
  description = "List of workspaces created with their assigned team access"
  value = {
    for key, ws in tfe_workspace.workspaces :
    key => {
      id          = ws.id
      name        = ws.name
      team_id     = tfe_team.new_team.id
      team_access = var.workspaces[key].team_access
    }
  }
}