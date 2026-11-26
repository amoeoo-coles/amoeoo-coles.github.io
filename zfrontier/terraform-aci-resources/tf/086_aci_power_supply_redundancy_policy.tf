# 086 · resource aci_power_supply_redundancy_policy · 1. System and fabric setup
# Manages ACI Power Supply Redundancy Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_power_supply_redundancy_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_086 = yamldecode(file("${path.module}/../models/aci_power_supply_redundancy_policy.yml"))["aci_power_supply_redundancy_policy"]
}

resource "aci_power_supply_redundancy_policy" "n086" {
  administrative_state = local.m_086["administrative_state"]
  annotation           = local.m_086["annotation"]
  description          = local.m_086["description"]
  name                 = local.m_086["name"]
  name_alias           = local.m_086["name_alias"]
}
