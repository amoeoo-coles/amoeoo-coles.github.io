# 250 · data source aci_spine_interface_profile_selector · 2. Access policies
# Data source for ACI Spine Interface Profile Selector
# APIC class: not collected · DN: not collected
# Reads models/data_aci_spine_interface_profile_selector.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_250 = yamldecode(file("${path.module}/../models/data_aci_spine_interface_profile_selector.yml"))["data_aci_spine_interface_profile_selector"]
}

data "aci_spine_interface_profile_selector" "n250" {
  annotation       = local.m_250["annotation"]
  spine_profile_dn = local.m_250["spine_profile_dn"]
  tdn              = local.m_250["tdn"]
}

output "n250_data_aci_spine_interface_profile_selector_id" {
  value = data.aci_spine_interface_profile_selector.n250.id
}
