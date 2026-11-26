# 058 · resource mso_schema_site_anp_epg_static_port · 6. ANP and EPG
# Manages MSO Schema Template Application Network Profiles Endpoint Groups Static Port.
# Class: not collected · DN: not collected
# Reads models/mso_schema_site_anp_epg_static_port.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_058 = yamldecode(file("${path.module}/../models/mso_schema_site_anp_epg_static_port.yml"))["mso_schema_site_anp_epg_static_port"]
}

resource "mso_schema_site_anp_epg_static_port" "n058" {
  anp_name             = local.m_058["anp_name"]
  deployment_immediacy = local.m_058["deployment_immediacy"]
  epg_name             = local.m_058["epg_name"]
  fex                  = local.m_058["fex"]
  leaf                 = local.m_058["leaf"]
  micro_seg_vlan       = local.m_058["micro_seg_vlan"]
  mode                 = local.m_058["mode"]
  path                 = local.m_058["path"]
  path_type            = local.m_058["path_type"]
  pod                  = local.m_058["pod"]
  schema_id            = local.m_058["schema_id"]
  site_id              = local.m_058["site_id"]
  template_name        = local.m_058["template_name"]
  vlan                 = local.m_058["vlan"]
}
