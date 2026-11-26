# 509 · resource sdwan_route_policy_definition · 13. (Classic) localized, centralized and security policies
# This resource can manage a Route Policy Definition .
# Reads models/sdwan_route_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_509 = yamldecode(file("${path.module}/../models/sdwan_route_policy_definition.yml"))["sdwan_route_policy_definition"]
}

resource "sdwan_route_policy_definition" "n509" {
  default_action = local.m_509["default_action"]
  description = local.m_509["description"]
  name = local.m_509["name"]
  sequences = local.m_509["sequences"]
}
