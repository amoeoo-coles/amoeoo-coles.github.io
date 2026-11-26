# 076 · resource mso_schema_site_external_epg_selector · 7. Contracts, filters and external EPGs
# Manages MSO Schema site external Endpoint Groups selectors.
# Class: not collected · DN: not collected
# Reads models/mso_schema_site_external_epg_selector.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_076 = yamldecode(file("${path.module}/../models/mso_schema_site_external_epg_selector.yml"))["mso_schema_site_external_epg_selector"]
}

resource "mso_schema_site_external_epg_selector" "n076" {
  external_epg_name = local.m_076["external_epg_name"]
  ip                = local.m_076["ip"]
  name              = local.m_076["name"]
  schema_id         = local.m_076["schema_id"]
  site_id           = local.m_076["site_id"]
  template_name     = local.m_076["template_name"]
}
