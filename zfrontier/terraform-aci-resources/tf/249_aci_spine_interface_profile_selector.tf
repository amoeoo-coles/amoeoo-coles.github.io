# 249 · resource aci_spine_interface_profile_selector · 2. Access policies
# Manages ACI Spine Interface Profile selector
# APIC class: not collected · DN: not collected
# Reads models/aci_spine_interface_profile_selector.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_249 = yamldecode(file("${path.module}/../models/aci_spine_interface_profile_selector.yml"))["aci_spine_interface_profile_selector"]
}

resource "aci_spine_interface_profile_selector" "n249" {
  annotation       = local.m_249["annotation"]
  spine_profile_dn = local.m_249["spine_profile_dn"]
  tdn              = local.m_249["tdn"]
}
