# 545 · data source sdwan_tls_ssl_profile_policy_definition · 13. (Classic) localized, centralized and security policies
# This data source can read the TLS SSL Profile Policy Definition .
# Reads models/data_sdwan_tls_ssl_profile_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_545 = yamldecode(file("${path.module}/../models/data_sdwan_tls_ssl_profile_policy_definition.yml"))["data_sdwan_tls_ssl_profile_policy_definition"]
}

data "sdwan_tls_ssl_profile_policy_definition" "n545" {
  id = local.m_545["id"]
}

output "n545_data_sdwan_tls_ssl_profile_policy_definition_id" {
  value = data.sdwan_tls_ssl_profile_policy_definition.n545.id
}
