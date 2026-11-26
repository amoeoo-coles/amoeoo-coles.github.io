# 341 · data source sdwan_dns_security_policy · 9. Configuration, policy and topology groups
# This data source can read the DNS Security Policy.
# Reads models/data_sdwan_dns_security_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_341 = yamldecode(file("${path.module}/../models/data_sdwan_dns_security_policy.yml"))["data_sdwan_dns_security_policy"]
}

data "sdwan_dns_security_policy" "n341" {
  feature_profile_id = local.m_341["feature_profile_id"]
  id = local.m_341["id"]
  name = local.m_341["name"]
}

output "n341_data_sdwan_dns_security_policy_id" {
  value = data.sdwan_dns_security_policy.n341.id
}
