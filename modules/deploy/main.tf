terraform {
  required_providers {
    mso = {
      source = "CiscoDevNet/mso"
    }
  }
}

################################################################################
# Attach Schema to Site
################################################################################

# Add Intersite network to Sites
resource "mso_schema_site" "add_intersite" {
  schema_id     = var.schema_id
  site_id       = "617ab3383e06aed4a8773148"
  template_name = var.intersite_template
}
resource "mso_schema_site" "add_intersite2" {
  schema_id     = var.schema_id
  site_id       = "617ab36f3e06aed4a8773149"
  template_name = var.intersite_template
}

# Add site 1 to template
resource "mso_schema_site" "add_site_details" {
  schema_id     = var.schema_id
  site_id       = "617ab3383e06aed4a8773148"
  template_name = "terra-site1"
}

# Add site 2 to template

resource "mso_schema_site" "add_site_details2" {
  schema_id     = var.schema_id
  site_id       = "617ab36f3e06aed4a8773149"
  template_name = var.site_template
}

################################################################################
# Deploy The Schema to ACI Site
################################################################################

# Deploy Intersite network configuration to sites
resource "mso_schema_template_deploy" "deploy_intersite" {
  schema_id     = var.schema_id
  template_name = var.intersite_template
  site_id       = var.site_id
  undeploy      = false
}

# Deploy Site 1 specific network configuration to site
resource "mso_schema_template_deploy" "deploy_site_details" {
  schema_id     = var.schema_id
  template_name = "terra-site1"
  site_id       = "617ab3383e06aed4a8773148"
  undeploy      = false
}

# Deploy Site 1 specific network configuration to site

resource "mso_schema_template_deploy" "deploy_site_details2" {
  schema_id     = var.schema_id
  template_name = var.site_template
  site_id       = "617ab36f3e06aed4a8773149"
  undeploy      = false
}

