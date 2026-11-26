# 048 · resource mso_schema_site_anp_epg · 6. ANP and EPG
# Manages MSO Schema Site Application Network Profiles Endpoint Groups.
# Class: not collected · DN: not collected
# Reads models/mso_schema_site_anp_epg.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_048 = yamldecode(file("${path.module}/../models/mso_schema_site_anp_epg.yml"))["mso_schema_site_anp_epg"]
}

resource "mso_schema_site_anp_epg" "n048" {
  anp_name           = local.m_048["anp_name"]
  epg_name           = local.m_048["epg_name"]
  private_link_label = local.m_048["private_link_label"]
  schema_id          = local.m_048["schema_id"]
  site_id            = local.m_048["site_id"]
  template_name      = local.m_048["template_name"]
}
