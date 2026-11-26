# 501 · resource sdwan_ipv6_device_acl_policy_definition · 13. (Classic) localized, centralized and security policies
# This resource can manage a IPv6 Device ACL Policy Definition .
# Reads models/sdwan_ipv6_device_acl_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_501 = yamldecode(file("${path.module}/../models/sdwan_ipv6_device_acl_policy_definition.yml"))["sdwan_ipv6_device_acl_policy_definition"]
}

resource "sdwan_ipv6_device_acl_policy_definition" "n501" {
  default_action = local.m_501["default_action"]
  description = local.m_501["description"]
  name = local.m_501["name"]
  sequences = local.m_501["sequences"]
}
