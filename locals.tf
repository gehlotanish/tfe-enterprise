# # Placeholder for Terraform code
# # Should contain global local variables

locals {
  existing_project = try([for p in data.tfe_projects.existing_projects.projects : p if p.name == var.project_name][0], null)
  project_id       = local.existing_project != null ? local.existing_project.id : tfe_project.project.id
}