# 095 · resource sdwan_policy_object_unified_tls_ssl_profile · 3. Policy objects and custom applications
# This resource can manage a Policy Object Unified TLS SSL Profile Policy_object. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_unified_tls_ssl_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_095 = yamldecode(file("${path.module}/../models/sdwan_policy_object_unified_tls_ssl_profile.yml"))["sdwan_policy_object_unified_tls_ssl_profile"]
}

resource "sdwan_policy_object_unified_tls_ssl_profile" "n095" {
  decrypt_categories      = local.m_095["decrypt_categories"]
  decrypt_threshold       = local.m_095["decrypt_threshold"]
  description             = local.m_095["description"]
  fail_decrypt            = local.m_095["fail_decrypt"]
  feature_profile_id      = local.m_095["feature_profile_id"]
  name                    = local.m_095["name"]
  no_decrypt_categories   = local.m_095["no_decrypt_categories"]
  pass_through_categories = local.m_095["pass_through_categories"]
  reputation              = local.m_095["reputation"]
  threshold_categories    = local.m_095["threshold_categories"]
  url_allow_list_id       = local.m_095["url_allow_list_id"]
  url_block_list_id       = local.m_095["url_block_list_id"]
}
