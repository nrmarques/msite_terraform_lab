# Author: NMARQUES
# Description: ACI Multi-Site lab

terraform {
  required_providers {
    mso = {
      source = "CiscoDevNet/mso"
    }
  }
}

provider "mso" {
  username = var.mso_username
  password = var.mso_password
  url      = var.mso_url
  insecure = true
  # If Nexus Dashboard is used platform must be set to "nd".
  platform = "nd"
}

# Create Multi-site schema with shared Intersite template
# Provide the corresponding variables

module "create_schema" {
  source             = "./modules/schema"
  site2_name         = "SITE2"
  site1_name         = "SITE1"
  tenant             = "terra-ax-t1"
  schema             = "terra-ax-msite"
  intersite_template = "terra-intersite"
  site1_template     = "terra-site1"
  site2_template     = "terra-site2"
}

module "create_intersite_template" {
  source             = "./modules/intersite_template"
  ap_intersite       = "terra-intersite-ap"
  epg_intersite      = "terra-intersite-gw-epg"
  vrf_intersite      = "terra-intersite-vrf"
  bd_intersite       = "terra-intersite-bd"
  c_permit_all_site1 = "terra-site1-contract"
  c_permit_all_site2 = "terra-site2-contract"
  f_permit_all       = "terra-permit-all"
  bd_intersite_subnet = "10.1.1.1/24"
  schema_id          = module.create_schema.schema_id
  intersite_template = module.create_schema.intersite_template
}

# Create Multi-site schema with site specific templates for each ACI site
# Provide the corresponding variables

module "create_site1_template" {
  source             = "./modules/site_template"
  ap                 = "terra-site1-ap"
  epg                = "terra-site1-epg"
  bd                 = "terra-site1-bd"
  template           = module.create_schema.site1_template
  intersite_template = module.create_schema.intersite_template
  schema_id          = module.create_schema.schema_id
  site_contract      = module.create_intersite_template.site1_contract
  intersite_vrf      = module.create_intersite_template.intersite_vrf
}

module "create_site2_template" {
  source             = "./modules/site_template"
  ap                 = "terra-site2-ap"
  epg                = "terra-site2-epg"
  bd                 = "terra-site2-bd"
  template           = module.create_schema.site2_template
  intersite_template = module.create_schema.intersite_template
  schema_id          = module.create_schema.schema_id
  site_contract      = module.create_intersite_template.site2_contract
  intersite_vrf      = module.create_intersite_template.intersite_vrf
}


# Module deploy 
##### Do not change #####

module "deploy" {
  source             = "./modules/deploy"
  schema_id          = module.create_schema.schema_id
  site_id            = module.create_schema.aci-site-id
  intersite_template = module.create_schema.intersite_template
  site_template      = module.create_schema.site2_template 
  
}

