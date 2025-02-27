# template-terraform
Template repository for all terraform module repositories

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
| <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name) | Name of the Terraform Enterprise organization | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the Terraform Enterprise project | `string` | n/a | yes |
| <a name="input_team_name"></a> [team\_name](#input\_team\_name) | Name of Team | `string` | n/a | yes |
| <a name="input_team_project_access"></a> [team\_project\_access](#input\_team\_project\_access) | Type of fixed access to grant. Valid values are admin, maintain, write, read, or custom | `string` | n/a | yes |
| <a name="input_tfe_token"></a> [tfe\_token](#input\_tfe\_token) | Terraform Enterprise API token | `string` | n/a | yes |
| <a name="input_vcs_oauth_token_id"></a> [vcs\_oauth\_token\_id](#input\_vcs\_oauth\_token\_id) | VSC github oauth token ID | `string` | n/a | yes |
| <a name="input_workspaces"></a> [workspaces](#input\_workspaces) | A map of workspace configurations | <pre>map(object({<br>    name                = string<br>    vcs_repo_identifier = string<br>    vcs_branch          = string<br>    execution_mode      = string<br>    variables = optional(map(object({<br>      key         = string<br>      value       = string<br>      category    = string # Ensure category is explicitly required<br>      description = string<br>    })), {})<br>  }))</pre> | n/a | yes |  
## Outputs

No outputs.
<!-- END_TF_DOCS -->