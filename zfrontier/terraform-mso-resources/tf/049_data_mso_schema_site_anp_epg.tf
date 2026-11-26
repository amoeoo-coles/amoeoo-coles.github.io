# 049 · data source mso_schema_site_anp_epg · 6. ANP and EPG
# Data source for MSO Schema Site ANP End Point Group (EPG).
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_site_anp_epg.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_049 = yamldecode(file("${path.module}/../models/data_mso_schema_site_anp_epg.yml"))["data_mso_schema_site_anp_epg"]
}

data "mso_schema_site_anp_epg" "n049" {
  anp_name      = local.m_049["anp_name"]
  epg_name      = local.m_049["epg_name"]
  schema_id     = local.m_049["schema_id"]
  site_id       = local.m_049["site_id"]
  template_name = local.m_049["template_name"]
}

output "n049_data_mso_schema_site_anp_epg_id" {
  value = data.mso_schema_site_anp_epg.n049.id
}
