# # Placeholder for Terraform code
# # Should contain all output variables of modules

output "organization_name" {
  description = "The name of the organization"
  value       = data.tfe_organization.org.name
}

output "project_id" {
  description = "The ID of the created project"
  value       = tfe_project.project.id
}

output "team_id" {
  description = "The ID of the created team"
  value       = tfe_team.new_team.id
}

output "team_name" {
  description = "The name of the created team"
  value       = tfe_team.new_team.name
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