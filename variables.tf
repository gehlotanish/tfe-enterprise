# Placeholder for Terraform code
# Should contain all input variables of module
variable "tfe_token" {
  description = "Terraform Enterprise API token"
  type        = string
  sensitive   = true
}

variable "organization_name" {
  description = "Name of the Terraform Enterprise organization"
  type        = string
}

variable "team_name" {
  description = "Name of Team"
  type        = string
}

variable "team_project_access" {
  description = "Type of fixed access to grant. Valid values are admin, maintain, write, read, or custom"
  type        = string
}

variable "project_name" {
  description = "Name of the Terraform Enterprise project"
  type        = string
}

variable "workspace_name" {
  description = "Name of the Terraform Enterprise workspace"
  type        = string
}

variable "vcs_repo_identifier" {
  description = "VCS repository identifier (e.g., github-org/repo-name)"
  type        = string
}

variable "vcs_branch" {
  description = "Branch to track in the VCS repository"
  type        = string
  default     = "main"
}

variable "vcs_github_app_installation_id" {
  description = "Vcs GH app installation id"
  type        = string
  default     = "value"
}

variable "execution_mode" {
  description = "Execution mode of the workspace (e.g., remote, local, agent)"
  type        = string
  default     = "remote"
}

variable "workspace_variables" {
  description = "workspace Variable"
  type = map(object({
    value       = string
    category    = string
    description = string
  }))
}

variable "ssh_key_name" {
  type        = string
  description = "The ID of an SSH key to assign to the workspace."
}