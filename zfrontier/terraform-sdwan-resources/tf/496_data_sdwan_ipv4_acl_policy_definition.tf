# 496 · data source sdwan_ipv4_acl_policy_definition · 13. (Classic) localized, centralized and security policies
# This data source can read the IPv4 ACL Policy Definition .
# Reads models/data_sdwan_ipv4_acl_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_496 = yamldecode(file("${path.module}/../models/data_sdwan_ipv4_acl_policy_definition.yml"))["data_sdwan_ipv4_acl_policy_definition"]
}

data "sdwan_ipv4_acl_policy_definition" "n496" {
  id = local.m_496["id"]
}

output "n496_data_sdwan_ipv4_acl_policy_definition_id" {
  value = data.sdwan_ipv4_acl_policy_definition.n496.id
}
