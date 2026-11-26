# 380 · data source aci_match_route_destination_rule · 3. Tenant and networking
# Data source for ACI Match Route Destination Rule
# APIC class: not collected · DN: not collected
# Reads models/data_aci_match_route_destination_rule.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_380 = yamldecode(file("${path.module}/../models/data_aci_match_route_destination_rule.yml"))["data_aci_match_route_destination_rule"]
}

data "aci_match_route_destination_rule" "n380" {
  aggregate         = local.m_380["aggregate"]
  annotation        = local.m_380["annotation"]
  description       = local.m_380["description"]
  greater_than_mask = local.m_380["greater_than_mask"]
  ip                = local.m_380["ip"]
  less_than_mask    = local.m_380["less_than_mask"]
  match_rule_dn     = local.m_380["match_rule_dn"]
  name              = local.m_380["name"]
  name_alias        = local.m_380["name_alias"]
}

output "n380_data_aci_match_route_destination_rule_id" {
  value = data.aci_match_route_destination_rule.n380.id
}
