# 051 · data source mso_schema_site_anp_epg_bulk_staticport · 6. ANP and EPG
# Data source for MSO Schema Site ANP EPG Bulk Static Port.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_site_anp_epg_bulk_staticport.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_051 = yamldecode(file("${path.module}/../models/data_mso_schema_site_anp_epg_bulk_staticport.yml"))["data_mso_schema_site_anp_epg_bulk_staticport"]
}

data "mso_schema_site_anp_epg_bulk_staticport" "n051" {
  anp_name      = local.m_051["anp_name"]
  epg_name      = local.m_051["epg_name"]
  schema_id     = local.m_051["schema_id"]
  site_id       = local.m_051["site_id"]
  template_name = local.m_051["template_name"]
}

output "n051_data_mso_schema_site_anp_epg_bulk_staticport_id" {
  value = data.mso_schema_site_anp_epg_bulk_staticport.n051.id
}
