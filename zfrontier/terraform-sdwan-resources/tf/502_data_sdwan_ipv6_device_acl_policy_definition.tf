# 502 · data source sdwan_ipv6_device_acl_policy_definition · 13. (Classic) localized, centralized and security policies
# This data source can read the IPv6 Device ACL Policy Definition .
# Reads models/data_sdwan_ipv6_device_acl_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_502 = yamldecode(file("${path.module}/../models/data_sdwan_ipv6_device_acl_policy_definition.yml"))["data_sdwan_ipv6_device_acl_policy_definition"]
}

data "sdwan_ipv6_device_acl_policy_definition" "n502" {
  id = local.m_502["id"]
}

output "n502_data_sdwan_ipv6_device_acl_policy_definition_id" {
  value = data.sdwan_ipv6_device_acl_policy_definition.n502.id
}
