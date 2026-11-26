# 074 · resource mso_schema_site_external_epg · 7. Contracts, filters and external EPGs
# Manages MSO Schema Site External Endpoint Groups.
# Class: not collected · DN: not collected
# Reads models/mso_schema_site_external_epg.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_074 = yamldecode(file("${path.module}/../models/mso_schema_site_external_epg.yml"))["mso_schema_site_external_epg"]
}

resource "mso_schema_site_external_epg" "n074" {
  external_epg_name   = local.m_074["external_epg_name"]
  l3out_name          = local.m_074["l3out_name"]
  l3out_on_apic       = local.m_074["l3out_on_apic"]
  l3out_schema_id     = local.m_074["l3out_schema_id"]
  l3out_template_name = local.m_074["l3out_template_name"]
  schema_id           = local.m_074["schema_id"]
  site_id             = local.m_074["site_id"]
  template_name       = local.m_074["template_name"]
}
