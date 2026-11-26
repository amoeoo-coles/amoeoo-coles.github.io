# 534 · resource sdwan_intrusion_prevention_policy_definition · 13. (Classic) localized, centralized and security policies
# This resource can manage a Intrusion Prevention Policy Definition .
# Reads models/sdwan_intrusion_prevention_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_534 = yamldecode(file("${path.module}/../models/sdwan_intrusion_prevention_policy_definition.yml"))["sdwan_intrusion_prevention_policy_definition"]
}

resource "sdwan_intrusion_prevention_policy_definition" "n534" {
  custom_signature           = local.m_534["custom_signature"]
  description                = local.m_534["description"]
  inspection_mode            = local.m_534["inspection_mode"]
  ips_signature_list_id      = local.m_534["ips_signature_list_id"]
  ips_signature_list_version = local.m_534["ips_signature_list_version"]
  log_level                  = local.m_534["log_level"]
  logging                    = local.m_534["logging"]
  mode                       = local.m_534["mode"]
  name                       = local.m_534["name"]
  signature_set              = local.m_534["signature_set"]
  target_vpns                = local.m_534["target_vpns"]
}
