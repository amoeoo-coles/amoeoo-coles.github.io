# 544 · resource sdwan_tls_ssl_profile_policy_definition · 13. (Classic) localized, centralized and security policies
# This resource can manage a TLS SSL Profile Policy Definition .
# Reads models/sdwan_tls_ssl_profile_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_544 = yamldecode(file("${path.module}/../models/sdwan_tls_ssl_profile_policy_definition.yml"))["sdwan_tls_ssl_profile_policy_definition"]
}

resource "sdwan_tls_ssl_profile_policy_definition" "n544" {
  allow_url_list_id        = local.m_544["allow_url_list_id"]
  allow_url_list_version   = local.m_544["allow_url_list_version"]
  block_url_list_id        = local.m_544["block_url_list_id"]
  block_url_list_version   = local.m_544["block_url_list_version"]
  decrypt_categories       = local.m_544["decrypt_categories"]
  decrypt_threshold        = local.m_544["decrypt_threshold"]
  description              = local.m_544["description"]
  fail_decrypt             = local.m_544["fail_decrypt"]
  mode                     = local.m_544["mode"]
  name                     = local.m_544["name"]
  never_decrypt_categories = local.m_544["never_decrypt_categories"]
  reputation               = local.m_544["reputation"]
  skip_decrypt_categories  = local.m_544["skip_decrypt_categories"]
}
