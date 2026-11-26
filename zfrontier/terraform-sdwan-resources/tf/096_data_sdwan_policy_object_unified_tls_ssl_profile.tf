# 096 · data source sdwan_policy_object_unified_tls_ssl_profile · 3. Policy objects and custom applications
# This data source can read the Policy Object Unified TLS SSL Profile Policy_object.
# Reads models/data_sdwan_policy_object_unified_tls_ssl_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_096 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_unified_tls_ssl_profile.yml"))["data_sdwan_policy_object_unified_tls_ssl_profile"]
}

data "sdwan_policy_object_unified_tls_ssl_profile" "n096" {
  feature_profile_id = local.m_096["feature_profile_id"]
  id                 = local.m_096["id"]
  name               = local.m_096["name"]
}

output "n096_data_sdwan_policy_object_unified_tls_ssl_profile_id" {
  value = data.sdwan_policy_object_unified_tls_ssl_profile.n096.id
}
