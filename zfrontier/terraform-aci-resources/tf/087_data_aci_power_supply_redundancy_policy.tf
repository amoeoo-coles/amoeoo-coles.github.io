# 087 · data source aci_power_supply_redundancy_policy · 1. System and fabric setup
# Data source for ACI Power Supply Redundancy Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_power_supply_redundancy_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_087 = yamldecode(file("${path.module}/../models/data_aci_power_supply_redundancy_policy.yml"))["data_aci_power_supply_redundancy_policy"]
}

data "aci_power_supply_redundancy_policy" "n087" {
  annotation  = local.m_087["annotation"]
  description = local.m_087["description"]
  name        = local.m_087["name"]
  name_alias  = local.m_087["name_alias"]
}

output "n087_data_aci_power_supply_redundancy_policy_id" {
  value = data.aci_power_supply_redundancy_policy.n087.id
}
