# 542 · resource sdwan_tls_ssl_decryption_policy_definition · 13. (Classic) localized, centralized and security policies
# This resource can manage a TLS SSL Decryption Policy Definition .
# Reads models/sdwan_tls_ssl_decryption_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_542 = yamldecode(file("${path.module}/../models/sdwan_tls_ssl_decryption_policy_definition.yml"))["sdwan_tls_ssl_decryption_policy_definition"]
}

resource "sdwan_tls_ssl_decryption_policy_definition" "n542" {
  certificate_lifetime_in_days  = local.m_542["certificate_lifetime_in_days"]
  certificate_revocation_status = local.m_542["certificate_revocation_status"]
  default_action                = local.m_542["default_action"]
  description                   = local.m_542["description"]
  ec_key_type                   = local.m_542["ec_key_type"]
  expired_certificate           = local.m_542["expired_certificate"]
  failure_mode                  = local.m_542["failure_mode"]
  minimal_tls_version           = local.m_542["minimal_tls_version"]
  mode                          = local.m_542["mode"]
  name                          = local.m_542["name"]
  network_rules                 = local.m_542["network_rules"]
  rsa_key_pair_modulus          = local.m_542["rsa_key_pair_modulus"]
  ssl_decryption_enabled        = local.m_542["ssl_decryption_enabled"]
  unknown_revocation_status     = local.m_542["unknown_revocation_status"]
  unsupported_cipher_suites     = local.m_542["unsupported_cipher_suites"]
  unsupported_protocol_versions = local.m_542["unsupported_protocol_versions"]
  untrusted_certificate         = local.m_542["untrusted_certificate"]
  url_rules                     = local.m_542["url_rules"]
  use_default_ca_cert_bundle    = local.m_542["use_default_ca_cert_bundle"]
}
