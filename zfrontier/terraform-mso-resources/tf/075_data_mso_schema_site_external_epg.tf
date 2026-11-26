# 075 · data source mso_schema_site_external_epg · 7. Contracts, filters and external EPGs
# Data source for MSO Schema Site External End Point Group.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_site_external_epg.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_075 = yamldecode(file("${path.module}/../models/data_mso_schema_site_external_epg.yml"))["data_mso_schema_site_external_epg"]
}

data "mso_schema_site_external_epg" "n075" {
  external_epg_name = local.m_075["external_epg_name"]
  schema_id         = local.m_075["schema_id"]
  site_id           = local.m_075["site_id"]
  template_name     = local.m_075["template_name"]
}

output "n075_data_mso_schema_site_external_epg_id" {
  value = data.mso_schema_site_external_epg.n075.id
}
