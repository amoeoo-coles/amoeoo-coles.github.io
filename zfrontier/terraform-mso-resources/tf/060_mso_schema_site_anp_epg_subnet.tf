# 060 · resource mso_schema_site_anp_epg_subnet · 6. ANP and EPG
# Manages MSO Schema Site Application Network Profiles Endpoint Groups Subnet.
# Class: not collected · DN: not collected
# Reads models/mso_schema_site_anp_epg_subnet.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_060 = yamldecode(file("${path.module}/../models/mso_schema_site_anp_epg_subnet.yml"))["mso_schema_site_anp_epg_subnet"]
}

resource "mso_schema_site_anp_epg_subnet" "n060" {
  anp_name               = local.m_060["anp_name"]
  description            = local.m_060["description"]
  epg_name               = local.m_060["epg_name"]
  ip                     = local.m_060["ip"]
  ip_data_plane_learning = local.m_060["ip_data_plane_learning"]
  no_default_gateway     = local.m_060["no_default_gateway"]
  primary                = local.m_060["primary"]
  querier                = local.m_060["querier"]
  schema_id              = local.m_060["schema_id"]
  scope                  = local.m_060["scope"]
  shared                 = local.m_060["shared"]
  site_id                = local.m_060["site_id"]
  template_name          = local.m_060["template_name"]
}
