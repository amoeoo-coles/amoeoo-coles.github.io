# 379 · resource aci_match_route_destination_rule · 3. Tenant and networking
# Manages ACI Match Route Destination Rule
# APIC class: not collected · DN: not collected
# Reads models/aci_match_route_destination_rule.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_379 = yamldecode(file("${path.module}/../models/aci_match_route_destination_rule.yml"))["aci_match_route_destination_rule"]
}

resource "aci_match_route_destination_rule" "n379" {
  aggregate         = local.m_379["aggregate"]
  annotation        = local.m_379["annotation"]
  description       = local.m_379["description"]
  greater_than_mask = local.m_379["greater_than_mask"]
  ip                = local.m_379["ip"]
  less_than_mask    = local.m_379["less_than_mask"]
  match_rule_dn     = local.m_379["match_rule_dn"]
  name              = local.m_379["name"]
  name_alias        = local.m_379["name_alias"]
}
