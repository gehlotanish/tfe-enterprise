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

variable "new_team_name" {
  description = "The name of the team to be created"
  type        = string
}

variable "team_members" {
  description = "List of email addresses of members to add to the team"
  type        = list(string)
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
    team_access         = string
    variables = optional(map(object({
      key         = string
      value       = string
      category    = string # Ensure category is explicitly required
      description = string
    })), {})
  }))
}
