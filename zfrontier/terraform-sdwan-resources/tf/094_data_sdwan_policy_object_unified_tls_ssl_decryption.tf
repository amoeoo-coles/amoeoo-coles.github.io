# 094 · data source sdwan_policy_object_unified_tls_ssl_decryption · 3. Policy objects and custom applications
# This data source can read the Policy Object Unified TLS SSL Decryption Policy_object.
# Reads models/data_sdwan_policy_object_unified_tls_ssl_decryption.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_094 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_unified_tls_ssl_decryption.yml"))["data_sdwan_policy_object_unified_tls_ssl_decryption"]
}

data "sdwan_policy_object_unified_tls_ssl_decryption" "n094" {
  feature_profile_id = local.m_094["feature_profile_id"]
  id                 = local.m_094["id"]
  name               = local.m_094["name"]
}

output "n094_data_sdwan_policy_object_unified_tls_ssl_decryption_id" {
  value = data.sdwan_policy_object_unified_tls_ssl_decryption.n094.id
}
