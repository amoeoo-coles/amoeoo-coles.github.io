# 039 · data source mso_schema_site_bd_l3out · 5. Bridge domains
# Data source for MSO Schema Site Bridge Domain L3out.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_site_bd_l3out.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_039 = yamldecode(file("${path.module}/../models/data_mso_schema_site_bd_l3out.yml"))["data_mso_schema_site_bd_l3out"]
}

data "mso_schema_site_bd_l3out" "n039" {
  bd_name             = local.m_039["bd_name"]
  l3out_name          = local.m_039["l3out_name"]
  l3out_schema_id     = local.m_039["l3out_schema_id"]
  l3out_template_name = local.m_039["l3out_template_name"]
  schema_id           = local.m_039["schema_id"]
  site_id             = local.m_039["site_id"]
  template_name       = local.m_039["template_name"]
}

output "n039_data_mso_schema_site_bd_l3out_id" {
  value = data.mso_schema_site_bd_l3out.n039.id
}
