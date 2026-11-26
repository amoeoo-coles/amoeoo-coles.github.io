# 503 · resource sdwan_localized_policy · 13. (Classic) localized, centralized and security policies
# This resource can manage a Localized Policy .
# Reads models/sdwan_localized_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_503 = yamldecode(file("${path.module}/../models/sdwan_localized_policy.yml"))["sdwan_localized_policy"]
}

resource "sdwan_localized_policy" "n503" {
  application_visibility_ipv4 = local.m_503["application_visibility_ipv4"]
  application_visibility_ipv6 = local.m_503["application_visibility_ipv6"]
  cloud_qos = local.m_503["cloud_qos"]
  cloud_qos_service_side = local.m_503["cloud_qos_service_side"]
  definitions = local.m_503["definitions"]
  description = local.m_503["description"]
  flow_visibility_ipv4 = local.m_503["flow_visibility_ipv4"]
  flow_visibility_ipv6 = local.m_503["flow_visibility_ipv6"]
  implicit_acl_logging = local.m_503["implicit_acl_logging"]
  ipv4_visibility_cache_entries = local.m_503["ipv4_visibility_cache_entries"]
  ipv6_visibility_cache_entries = local.m_503["ipv6_visibility_cache_entries"]
  log_frequency = local.m_503["log_frequency"]
  name = local.m_503["name"]
}
