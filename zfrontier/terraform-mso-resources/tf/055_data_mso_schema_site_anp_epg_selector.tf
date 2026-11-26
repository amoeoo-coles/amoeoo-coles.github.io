# 055 · data source mso_schema_site_anp_epg_selector · 6. ANP and EPG
# Data source for MSO Schema Site Application Network Profiles End Point Group Selector.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_site_anp_epg_selector.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_055 = yamldecode(file("${path.module}/../models/data_mso_schema_site_anp_epg_selector.yml"))["data_mso_schema_site_anp_epg_selector"]
}

data "mso_schema_site_anp_epg_selector" "n055" {
  anp_name      = local.m_055["anp_name"]
  epg_name      = local.m_055["epg_name"]
  name          = local.m_055["name"]
  schema_id     = local.m_055["schema_id"]
  site_id       = local.m_055["site_id"]
  template_name = local.m_055["template_name"]
}

output "n055_data_mso_schema_site_anp_epg_selector_id" {
  value = data.mso_schema_site_anp_epg_selector.n055.id
}
