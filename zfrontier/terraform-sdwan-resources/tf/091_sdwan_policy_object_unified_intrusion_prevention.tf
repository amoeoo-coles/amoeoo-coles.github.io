# 091 · resource sdwan_policy_object_unified_intrusion_prevention · 3. Policy objects and custom applications
# This resource can manage a Policy Object Unified Intrusion Prevention Policy_object. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_unified_intrusion_prevention.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_091 = yamldecode(file("${path.module}/../models/sdwan_policy_object_unified_intrusion_prevention.yml"))["sdwan_policy_object_unified_intrusion_prevention"]
}

resource "sdwan_policy_object_unified_intrusion_prevention" "n091" {
  custom_signature            = local.m_091["custom_signature"]
  description                 = local.m_091["description"]
  feature_profile_id          = local.m_091["feature_profile_id"]
  inspection_mode             = local.m_091["inspection_mode"]
  ips_signature_allow_list_id = local.m_091["ips_signature_allow_list_id"]
  log_level                   = local.m_091["log_level"]
  name                        = local.m_091["name"]
  signature_set               = local.m_091["signature_set"]
  signature_set_id            = local.m_091["signature_set_id"]
}
