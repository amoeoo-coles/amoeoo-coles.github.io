# 087 · resource sdwan_policy_object_unified_advanced_inspection_profile · 3. Policy objects and custom applications
# This resource can manage a Policy Object Unified Advanced Inspection Profile Policy_object. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_unified_advanced_inspection_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_087 = yamldecode(file("${path.module}/../models/sdwan_policy_object_unified_advanced_inspection_profile.yml"))["sdwan_policy_object_unified_advanced_inspection_profile"]
}

resource "sdwan_policy_object_unified_advanced_inspection_profile" "n087" {
  advanced_malware_protection_list_id = local.m_087["advanced_malware_protection_list_id"]
  description                         = local.m_087["description"]
  feature_profile_id                  = local.m_087["feature_profile_id"]
  intrusion_prevention_list_id        = local.m_087["intrusion_prevention_list_id"]
  name                                = local.m_087["name"]
  tls_decryption_action               = local.m_087["tls_decryption_action"]
  tls_ssl_profile_list_id             = local.m_087["tls_ssl_profile_list_id"]
  url_filtering_list_id               = local.m_087["url_filtering_list_id"]
}
