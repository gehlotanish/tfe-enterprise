# Placeholder for Terraform code
# Should contain all output variables of modules

output "project_id" {
  description = "The ID of the created or existing project."
  value       = local.project_id
}

output "workspace_id" {
  description = "The ID of the created workspace."
  value       = tfe_workspace.workspace.id
}
