# 528 · resource sdwan_advanced_inspection_profile_policy_definition · 13. (Classic) localized, centralized and security policies
# This resource can manage a Advanced Inspection Profile Policy Definition .
# Reads models/sdwan_advanced_inspection_profile_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_528 = yamldecode(file("${path.module}/../models/sdwan_advanced_inspection_profile_policy_definition.yml"))["sdwan_advanced_inspection_profile_policy_definition"]
}

resource "sdwan_advanced_inspection_profile_policy_definition" "n528" {
  advanced_malware_protection_id = local.m_528["advanced_malware_protection_id"]
  advanced_malware_protection_version = local.m_528["advanced_malware_protection_version"]
  description = local.m_528["description"]
  intrusion_prevention_id = local.m_528["intrusion_prevention_id"]
  intrusion_prevention_version = local.m_528["intrusion_prevention_version"]
  name = local.m_528["name"]
  tls_action = local.m_528["tls_action"]
  tls_ssl_decryption_id = local.m_528["tls_ssl_decryption_id"]
  tls_ssl_decryption_version = local.m_528["tls_ssl_decryption_version"]
  url_filtering_id = local.m_528["url_filtering_id"]
  url_filtering_version = local.m_528["url_filtering_version"]
}
