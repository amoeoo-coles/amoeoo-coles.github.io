# 500 · data source sdwan_ipv6_acl_policy_definition · 13. (Classic) localized, centralized and security policies
# This data source can read the IPv6 ACL Policy Definition .
# Reads models/data_sdwan_ipv6_acl_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_500 = yamldecode(file("${path.module}/../models/data_sdwan_ipv6_acl_policy_definition.yml"))["data_sdwan_ipv6_acl_policy_definition"]
}

data "sdwan_ipv6_acl_policy_definition" "n500" {
  id = local.m_500["id"]
}

output "n500_data_sdwan_ipv6_acl_policy_definition_id" {
  value = data.sdwan_ipv6_acl_policy_definition.n500.id
}
