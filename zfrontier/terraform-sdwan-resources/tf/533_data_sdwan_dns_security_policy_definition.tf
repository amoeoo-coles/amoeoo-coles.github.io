# 533 · data source sdwan_dns_security_policy_definition · 13. (Classic) localized, centralized and security policies
# This data source can read the DNS Security Policy Definition .
# Reads models/data_sdwan_dns_security_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_533 = yamldecode(file("${path.module}/../models/data_sdwan_dns_security_policy_definition.yml"))["data_sdwan_dns_security_policy_definition"]
}

data "sdwan_dns_security_policy_definition" "n533" {
  id = local.m_533["id"]
}

output "n533_data_sdwan_dns_security_policy_definition_id" {
  value = data.sdwan_dns_security_policy_definition.n533.id
}
