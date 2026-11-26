# 088 · resource mso_schema_template_external_epg_subnet · 7. Contracts, filters and external EPGs
# Manages MSO Schema Template External EPG Subnet.
# Class: not collected · DN: not collected
# Reads models/mso_schema_template_external_epg_subnet.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_088 = yamldecode(file("${path.module}/../models/mso_schema_template_external_epg_subnet.yml"))["mso_schema_template_external_epg_subnet"]
}

resource "mso_schema_template_external_epg_subnet" "n088" {
  aggregate         = local.m_088["aggregate"]
  external_epg_name = local.m_088["external_epg_name"]
  ip                = local.m_088["ip"]
  name              = local.m_088["name"]
  schema_id         = local.m_088["schema_id"]
  scope             = local.m_088["scope"]
  template_name     = local.m_088["template_name"]
}
