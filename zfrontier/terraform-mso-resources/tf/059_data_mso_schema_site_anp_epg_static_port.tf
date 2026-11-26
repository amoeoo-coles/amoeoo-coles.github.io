# 059 · data source mso_schema_site_anp_epg_static_port · 6. ANP and EPG
# Data source for MSO Schema Site ANP EPG Static Port.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_site_anp_epg_static_port.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_059 = yamldecode(file("${path.module}/../models/data_mso_schema_site_anp_epg_static_port.yml"))["data_mso_schema_site_anp_epg_static_port"]
}

data "mso_schema_site_anp_epg_static_port" "n059" {
  anp_name      = local.m_059["anp_name"]
  epg_name      = local.m_059["epg_name"]
  fex           = local.m_059["fex"]
  leaf          = local.m_059["leaf"]
  path          = local.m_059["path"]
  path_type     = local.m_059["path_type"]
  pod           = local.m_059["pod"]
  schema_id     = local.m_059["schema_id"]
  site_id       = local.m_059["site_id"]
  template_name = local.m_059["template_name"]
}

output "n059_data_mso_schema_site_anp_epg_static_port_id" {
  value = data.mso_schema_site_anp_epg_static_port.n059.id
}
