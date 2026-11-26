# 061 · data source mso_schema_site_anp_epg_subnet · 6. ANP and EPG
# Data source for MSO Schema Site ANP EPG Subnet.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_site_anp_epg_subnet.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_061 = yamldecode(file("${path.module}/../models/data_mso_schema_site_anp_epg_subnet.yml"))["data_mso_schema_site_anp_epg_subnet"]
}

data "mso_schema_site_anp_epg_subnet" "n061" {
  anp_name      = local.m_061["anp_name"]
  epg_name      = local.m_061["epg_name"]
  ip            = local.m_061["ip"]
  schema_id     = local.m_061["schema_id"]
  site_id       = local.m_061["site_id"]
  template_name = local.m_061["template_name"]
}

output "n061_data_mso_schema_site_anp_epg_subnet_id" {
  value = data.mso_schema_site_anp_epg_subnet.n061.id
}
