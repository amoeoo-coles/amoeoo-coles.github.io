# 548 · resource sdwan_zone_based_firewall_policy_definition · 13. (Classic) localized, centralized and security policies
# This resource can manage a Zone Based Firewall Policy Definition .
# Reads models/sdwan_zone_based_firewall_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_548 = yamldecode(file("${path.module}/../models/sdwan_zone_based_firewall_policy_definition.yml"))["sdwan_zone_based_firewall_policy_definition"]
}

resource "sdwan_zone_based_firewall_policy_definition" "n548" {
  apply_zone_pairs = local.m_548["apply_zone_pairs"]
  default_action = local.m_548["default_action"]
  description = local.m_548["description"]
  mode = local.m_548["mode"]
  name = local.m_548["name"]
  rules = local.m_548["rules"]
}
