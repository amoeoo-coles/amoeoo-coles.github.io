# 541 · data source sdwan_security_policy · 13. (Classic) localized, centralized and security policies
# This data source can read the Security Policy .
# Reads models/data_sdwan_security_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_541 = yamldecode(file("${path.module}/../models/data_sdwan_security_policy.yml"))["data_sdwan_security_policy"]
}

data "sdwan_security_policy" "n541" {
  id = local.m_541["id"]
}

output "n541_data_sdwan_security_policy_id" {
  value = data.sdwan_security_policy.n541.id
}
