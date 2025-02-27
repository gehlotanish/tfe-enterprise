data "tfe_organization" "org" {
  name = var.organization_name
}

data "tfe_team" "team" {
  name         = var.team_name
  organization = data.tfe_organization.org.name
}




