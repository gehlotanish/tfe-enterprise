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
| <a name="input_execution_mode"></a> [execution\_mode](#input\_execution\_mode) | Execution mode of the workspace (e.g., remote, local, agent) | `string` | `"remote"` | no |
| <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name) | Name of the Terraform Enterprise organization | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the Terraform Enterprise project | `string` | n/a | yes |
| <a name="input_ssh_key_id"></a> [ssh\_key\_id](#input\_ssh\_key\_id) | The ID of an SSH key to assign to the workspace. | `string` | n/a | yes |
| <a name="input_team_name"></a> [team\_name](#input\_team\_name) | Name of Team | `string` | n/a | yes |
| <a name="input_team_project_access"></a> [team\_project\_access](#input\_team\_project\_access) | Type of fixed access to grant. Valid values are admin, maintain, write, read, or custom | `string` | n/a | yes |
| <a name="input_tfe_token"></a> [tfe\_token](#input\_tfe\_token) | Terraform Enterprise API token | `string` | n/a | yes |
| <a name="input_vcs_branch"></a> [vcs\_branch](#input\_vcs\_branch) | Branch to track in the VCS repository | `string` | `"main"` | no |
| <a name="input_vcs_github_app_installation_id"></a> [vcs\_github\_app\_installation\_id](#input\_vcs\_github\_app\_installation\_id) | Vcs GH app installation id | `string` | n/a | yes |
| <a name="input_vcs_repo_identifier"></a> [vcs\_repo\_identifier](#input\_vcs\_repo\_identifier) | VCS repository identifier (e.g., github-org/repo-name) | `string` | n/a | yes |
| <a name="input_workspace_name"></a> [workspace\_name](#input\_workspace\_name) | Name of the Terraform Enterprise workspace | `string` | n/a | yes |
| <a name="input_workspace_variables"></a> [workspace\_variables](#input\_workspace\_variables) | workspace Variable | <pre>map(object({<br>    value       = string<br>    category    = string<br>    description = string<br>  }))</pre> | n/a | yes |  
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | The ID of the created or existing project. |
| <a name="output_workspace_id"></a> [workspace\_id](#output\_workspace\_id) | The ID of the created workspace. |
<!-- END_TF_DOCS -->