# 056 · resource mso_schema_site_anp_epg_static_leaf · 6. ANP and EPG
# Manages MSO Schema Site Application Network Profiles Endpoint Groups StaticLeaf.
# Class: not collected · DN: not collected
# Reads models/mso_schema_site_anp_epg_static_leaf.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_056 = yamldecode(file("${path.module}/../models/mso_schema_site_anp_epg_static_leaf.yml"))["mso_schema_site_anp_epg_static_leaf"]
}

resource "mso_schema_site_anp_epg_static_leaf" "n056" {
  anp_name        = local.m_056["anp_name"]
  epg_name        = local.m_056["epg_name"]
  path            = local.m_056["path"]
  port_encap_vlan = local.m_056["port_encap_vlan"]
  schema_id       = local.m_056["schema_id"]
  site_id         = local.m_056["site_id"]
  template_name   = local.m_056["template_name"]
}
