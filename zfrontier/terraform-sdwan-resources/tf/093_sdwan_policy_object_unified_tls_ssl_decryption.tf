# 093 · resource sdwan_policy_object_unified_tls_ssl_decryption · 3. Policy objects and custom applications
# This resource can manage a Policy Object Unified TLS SSL Decryption Policy_object. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_unified_tls_ssl_decryption.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_093 = yamldecode(file("${path.module}/../models/sdwan_policy_object_unified_tls_ssl_decryption.yml"))["sdwan_policy_object_unified_tls_ssl_decryption"]
}

resource "sdwan_policy_object_unified_tls_ssl_decryption" "n093" {
  bundle_string                 = local.m_093["bundle_string"]
  certificate_lifetime          = local.m_093["certificate_lifetime"]
  certificate_revocation_status = local.m_093["certificate_revocation_status"]
  default_ca_certificate_bundle = local.m_093["default_ca_certificate_bundle"]
  description                   = local.m_093["description"]
  ec_key_type                   = local.m_093["ec_key_type"]
  expired_certificate           = local.m_093["expired_certificate"]
  failure_mode                  = local.m_093["failure_mode"]
  feature_profile_id            = local.m_093["feature_profile_id"]
  file_name                     = local.m_093["file_name"]
  minimal_tls_ver               = local.m_093["minimal_tls_ver"]
  name                          = local.m_093["name"]
  rsa_keypair_modules           = local.m_093["rsa_keypair_modules"]
  unknown_revocation_status     = local.m_093["unknown_revocation_status"]
  unsupported_cipher_suites     = local.m_093["unsupported_cipher_suites"]
  unsupported_protocol_versions = local.m_093["unsupported_protocol_versions"]
  untrusted_certificate         = local.m_093["untrusted_certificate"]
}
