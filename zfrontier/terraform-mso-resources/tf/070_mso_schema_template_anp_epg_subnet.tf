# 070 · resource mso_schema_template_anp_epg_subnet · 6. ANP and EPG
# Manages MSO Schema Template Application Network Profiles Endpoint Groups Subnets.
# Class: not collected · DN: not collected
# Reads models/mso_schema_template_anp_epg_subnet.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_070 = yamldecode(file("${path.module}/../models/mso_schema_template_anp_epg_subnet.yml"))["mso_schema_template_anp_epg_subnet"]
}

resource "mso_schema_template_anp_epg_subnet" "n070" {
  anp_name               = local.m_070["anp_name"]
  description            = local.m_070["description"]
  epg_name               = local.m_070["epg_name"]
  ip                     = local.m_070["ip"]
  ip_data_plane_learning = local.m_070["ip_data_plane_learning"]
  no_default_gateway     = local.m_070["no_default_gateway"]
  primary                = local.m_070["primary"]
  querier                = local.m_070["querier"]
  schema_id              = local.m_070["schema_id"]
  scope                  = local.m_070["scope"]
  shared                 = local.m_070["shared"]
  template               = local.m_070["template"]
}
