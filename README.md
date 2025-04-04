# terraform enterprise module

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | ~> 0.64.0 |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.64.0 |
## Modules

No modules.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_new_team_name"></a> [new\_team\_name](#input\_new\_team\_name) | The name of the team to be created | `string` | n/a | yes |
| <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name) | Name of the Terraform Enterprise organization | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the Terraform Enterprise project | `string` | n/a | yes |
| <a name="input_team_members"></a> [team\_members](#input\_team\_members) | List of email addresses of members to add to the team | `list(string)` | n/a | yes |
| <a name="input_tfe_token"></a> [tfe\_token](#input\_tfe\_token) | Terraform Enterprise API token | `string` | n/a | yes |
| <a name="input_vcs_oauth_token_id"></a> [vcs\_oauth\_token\_id](#input\_vcs\_oauth\_token\_id) | VSC github oauth token ID | `string` | n/a | yes |
| <a name="input_workspaces"></a> [workspaces](#input\_workspaces) | A map of workspace configurations | <pre>map(object({<br>    name                = string<br>    vcs_repo_identifier = string<br>    vcs_branch          = string<br>    execution_mode      = string<br>    team_access         = string<br>    variables = optional(map(object({<br>      key         = string<br>      value       = string<br>      category    = string # Ensure category is explicitly required<br>      description = string<br>    })), {})<br>  }))</pre> | n/a | yes |  
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_organization_name"></a> [organization\_name](#output\_organization\_name) | The name of the organization |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | The ID of the created project |
| <a name="output_team_id"></a> [team\_id](#output\_team\_id) | The ID of the created team |
| <a name="output_team_name"></a> [team\_name](#output\_team\_name) | The name of the created team |
| <a name="output_workspaces"></a> [workspaces](#output\_workspaces) | List of workspaces created with their assigned team access |
<!-- END_TF_DOCS -->

## Usage

```tfvars
tfe_token          = "***"
organization_name  = "anishgehlot"
project_name       = "admin-tfe"
vcs_oauth_token_id = "ot-***"

new_team_name = "admin-demo"
team_members  = ["admin@gmail.com"]

workspaces = {
  "dev" = {
    name                = "dev-workspace"
    vcs_repo_identifier = "gehlotanish/terraform-keyvault-private"
    vcs_branch          = "main"
    execution_mode      = "remote"
    team_access         = "write"
    variables = {
      ENV = {
        key         = "ENV"
        value       = "development"
        category    = "env"
        description = "Development environment variable"
      }
      DB_PASS = {
        key         = "DB_PASS"
        value       = "securepassword"
        category    = "env"
        description = "Database password"
      }
    }
  },
  "prod" = {
    name                = "prod-workspace"
    vcs_repo_identifier = "gehlotanish/terraform-keyvault-private"
    vcs_branch          = "main"
    execution_mode      = "remote"
    team_access         = "write"
    variables = {
      ENV = {
        key         = "ENV"
        value       = "production"
        category    = "env"
        description = "Production environment variable"
      }
    }
  }
}
```
