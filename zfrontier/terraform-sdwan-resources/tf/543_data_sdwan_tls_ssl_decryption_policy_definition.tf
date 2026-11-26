# 543 · data source sdwan_tls_ssl_decryption_policy_definition · 13. (Classic) localized, centralized and security policies
# This data source can read the TLS SSL Decryption Policy Definition .
# Reads models/data_sdwan_tls_ssl_decryption_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_543 = yamldecode(file("${path.module}/../models/data_sdwan_tls_ssl_decryption_policy_definition.yml"))["data_sdwan_tls_ssl_decryption_policy_definition"]
}

data "sdwan_tls_ssl_decryption_policy_definition" "n543" {
  id = local.m_543["id"]
}

output "n543_data_sdwan_tls_ssl_decryption_policy_definition_id" {
  value = data.sdwan_tls_ssl_decryption_policy_definition.n543.id
}
