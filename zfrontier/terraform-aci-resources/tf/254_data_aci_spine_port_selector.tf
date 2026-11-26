# 254 · data source aci_spine_port_selector · 2. Access policies
# Data source for ACI Spine Port Selector
# APIC class: not collected · DN: not collected
# Reads models/data_aci_spine_port_selector.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_254 = yamldecode(file("${path.module}/../models/data_aci_spine_port_selector.yml"))["data_aci_spine_port_selector"]
}

data "aci_spine_port_selector" "n254" {
  spine_profile_dn = local.m_254["spine_profile_dn"]
  tdn              = local.m_254["tdn"]
}

output "n254_data_aci_spine_port_selector_id" {
  value = data.aci_spine_port_selector.n254.id
}
