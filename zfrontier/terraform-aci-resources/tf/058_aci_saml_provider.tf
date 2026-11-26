# 058 · resource aci_saml_provider · 1. System and fabric setup
# Manages ACI SAML Provider
# APIC class: not collected · DN: not collected
# Reads models/aci_saml_provider.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_058 = yamldecode(file("${path.module}/../models/aci_saml_provider.yml"))["aci_saml_provider"]
}

resource "aci_saml_provider" "n058" {
  annotation                      = local.m_058["annotation"]
  description                     = local.m_058["description"]
  entity_id                       = local.m_058["entity_id"]
  gui_banner_message              = local.m_058["gui_banner_message"]
  https_proxy                     = local.m_058["https_proxy"]
  id_p                            = local.m_058["id_p"]
  key                             = local.m_058["key"]
  metadata_url                    = local.m_058["metadata_url"]
  monitor_server                  = local.m_058["monitor_server"]
  monitoring_password             = local.m_058["monitoring_password"]
  monitoring_user                 = local.m_058["monitoring_user"]
  name                            = local.m_058["name"]
  name_alias                      = local.m_058["name_alias"]
  relation_aaa_rs_prov_to_epp     = local.m_058["relation_aaa_rs_prov_to_epp"]
  relation_aaa_rs_sec_prov_to_epg = local.m_058["relation_aaa_rs_sec_prov_to_epg"]
  retries                         = local.m_058["retries"]
  sig_alg                         = local.m_058["sig_alg"]
  timeout                         = local.m_058["timeout"]
  tp                              = local.m_058["tp"]
  want_assertions_encrypted       = local.m_058["want_assertions_encrypted"]
  want_assertions_signed          = local.m_058["want_assertions_signed"]
  want_requests_signed            = local.m_058["want_requests_signed"]
  want_response_signed            = local.m_058["want_response_signed"]
}
