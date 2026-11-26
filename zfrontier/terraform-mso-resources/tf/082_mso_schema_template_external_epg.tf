# 082 · resource mso_schema_template_external_epg · 7. Contracts, filters and external EPGs
# Manages MSO Schema Template External Endpoint Group.
# Class: not collected · DN: not collected
# Reads models/mso_schema_template_external_epg.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_082 = yamldecode(file("${path.module}/../models/mso_schema_template_external_epg.yml"))["mso_schema_template_external_epg"]
}

resource "mso_schema_template_external_epg" "n082" {
  anp_name                   = local.m_082["anp_name"]
  anp_schema_id              = local.m_082["anp_schema_id"]
  anp_template_name          = local.m_082["anp_template_name"]
  description                = local.m_082["description"]
  display_name               = local.m_082["display_name"]
  external_epg_name          = local.m_082["external_epg_name"]
  external_epg_type          = local.m_082["external_epg_type"]
  include_in_preferred_group = local.m_082["include_in_preferred_group"]
  l3out_name                 = local.m_082["l3out_name"]
  l3out_schema_id            = local.m_082["l3out_schema_id"]
  l3out_template_name        = local.m_082["l3out_template_name"]
  schema_id                  = local.m_082["schema_id"]
  selector_ip                = local.m_082["selector_ip"]
  selector_name              = local.m_082["selector_name"]
  site_id                    = local.m_082["site_id"]
  template_name              = local.m_082["template_name"]
  vrf_name                   = local.m_082["vrf_name"]
  vrf_schema_id              = local.m_082["vrf_schema_id"]
  vrf_template_name          = local.m_082["vrf_template_name"]
}
