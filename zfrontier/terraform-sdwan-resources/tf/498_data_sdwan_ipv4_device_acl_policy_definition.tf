# 498 · data source sdwan_ipv4_device_acl_policy_definition · 13. (Classic) localized, centralized and security policies
# This data source can read the IPv4 Device ACL Policy Definition .
# Reads models/data_sdwan_ipv4_device_acl_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_498 = yamldecode(file("${path.module}/../models/data_sdwan_ipv4_device_acl_policy_definition.yml"))["data_sdwan_ipv4_device_acl_policy_definition"]
}

data "sdwan_ipv4_device_acl_policy_definition" "n498" {
  id = local.m_498["id"]
}

output "n498_data_sdwan_ipv4_device_acl_policy_definition_id" {
  value = data.sdwan_ipv4_device_acl_policy_definition.n498.id
}
