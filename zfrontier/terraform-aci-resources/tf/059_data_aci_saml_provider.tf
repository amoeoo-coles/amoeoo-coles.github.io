# 059 · data source aci_saml_provider · 1. System and fabric setup
# Data source for ACI SAML Provider
# APIC class: not collected · DN: not collected
# Reads models/data_aci_saml_provider.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_059 = yamldecode(file("${path.module}/../models/data_aci_saml_provider.yml"))["data_aci_saml_provider"]
}

data "aci_saml_provider" "n059" {
  annotation                = local.m_059["annotation"]
  description               = local.m_059["description"]
  entity_id                 = local.m_059["entity_id"]
  gui_banner_message        = local.m_059["gui_banner_message"]
  https_proxy               = local.m_059["https_proxy"]
  id_p                      = local.m_059["id_p"]
  metadata_url              = local.m_059["metadata_url"]
  monitor_server            = local.m_059["monitor_server"]
  monitoring_user           = local.m_059["monitoring_user"]
  name                      = local.m_059["name"]
  name_alias                = local.m_059["name_alias"]
  retries                   = local.m_059["retries"]
  sig_alg                   = local.m_059["sig_alg"]
  timeout                   = local.m_059["timeout"]
  tp                        = local.m_059["tp"]
  want_assertions_encrypted = local.m_059["want_assertions_encrypted"]
  want_assertions_signed    = local.m_059["want_assertions_signed"]
  want_requests_signed      = local.m_059["want_requests_signed"]
  want_response_signed      = local.m_059["want_response_signed"]
}

output "n059_data_aci_saml_provider_id" {
  value = data.aci_saml_provider.n059.id
}
