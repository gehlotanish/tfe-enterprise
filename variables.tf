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

variable "vcs_oauth_token_id" {
  type        = string
  description = "VSC github oauth token ID"
}

# Workspaces Configuration (Multiple Workspaces)
variable "workspaces" {
  description = "A map of workspace configurations"
  type = map(object({
    name                = string
    vcs_repo_identifier = string
    vcs_branch          = string
    execution_mode      = string
    variables = optional(map(object({
      key         = string
      value       = string
      category    = string # Ensure category is explicitly required
      description = string
    })), {})
  }))
}
