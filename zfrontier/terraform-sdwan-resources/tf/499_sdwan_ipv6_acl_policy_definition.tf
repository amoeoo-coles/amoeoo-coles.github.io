# 499 · resource sdwan_ipv6_acl_policy_definition · 13. (Classic) localized, centralized and security policies
# This resource can manage a IPv6 ACL Policy Definition .
# Reads models/sdwan_ipv6_acl_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_499 = yamldecode(file("${path.module}/../models/sdwan_ipv6_acl_policy_definition.yml"))["sdwan_ipv6_acl_policy_definition"]
}

resource "sdwan_ipv6_acl_policy_definition" "n499" {
  default_action = local.m_499["default_action"]
  description    = local.m_499["description"]
  name           = local.m_499["name"]
  sequences      = local.m_499["sequences"]
}
