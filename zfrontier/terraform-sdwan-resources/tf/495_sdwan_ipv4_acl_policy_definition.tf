# 495 · resource sdwan_ipv4_acl_policy_definition · 13. (Classic) localized, centralized and security policies
# This resource can manage a IPv4 ACL Policy Definition .
# Reads models/sdwan_ipv4_acl_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_495 = yamldecode(file("${path.module}/../models/sdwan_ipv4_acl_policy_definition.yml"))["sdwan_ipv4_acl_policy_definition"]
}

resource "sdwan_ipv4_acl_policy_definition" "n495" {
  default_action = local.m_495["default_action"]
  description = local.m_495["description"]
  name = local.m_495["name"]
  sequences = local.m_495["sequences"]
}
