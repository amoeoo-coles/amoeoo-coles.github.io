# 064 · resource mso_schema_template_anp_epg · 6. ANP and EPG
# Manages MSO Schema Template Application Network Profiles Endpoint Groups.
# Class: not collected · DN: not collected
# Reads models/mso_schema_template_anp_epg.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_064 = yamldecode(file("${path.module}/../models/mso_schema_template_anp_epg.yml"))["mso_schema_template_anp_epg"]
}

resource "mso_schema_template_anp_epg" "n064" {
  access_type                = local.m_064["access_type"]
  anp_name                   = local.m_064["anp_name"]
  bd_name                    = local.m_064["bd_name"]
  bd_schema_id               = local.m_064["bd_schema_id"]
  bd_template_name           = local.m_064["bd_template_name"]
  custom_service_type        = local.m_064["custom_service_type"]
  deployment_type            = local.m_064["deployment_type"]
  description                = local.m_064["description"]
  display_name               = local.m_064["display_name"]
  epg_type                   = local.m_064["epg_type"]
  intersite_multicast_source = local.m_064["intersite_multicast_source"]
  intra_epg                  = local.m_064["intra_epg"]
  name                       = local.m_064["name"]
  preferred_group            = local.m_064["preferred_group"]
  proxy_arp                  = local.m_064["proxy_arp"]
  schema_id                  = local.m_064["schema_id"]
  service_type               = local.m_064["service_type"]
  template_name              = local.m_064["template_name"]
  useg_epg                   = local.m_064["useg_epg"]
  vrf_name                   = local.m_064["vrf_name"]
  vrf_schema_id              = local.m_064["vrf_schema_id"]
  vrf_template_name          = local.m_064["vrf_template_name"]
}
