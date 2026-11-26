# 253 · resource aci_spine_port_selector · 2. Access policies
# Manages ACI Spine Port selector
# APIC class: not collected · DN: not collected
# Reads models/aci_spine_port_selector.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_253 = yamldecode(file("${path.module}/../models/aci_spine_port_selector.yml"))["aci_spine_port_selector"]
}

resource "aci_spine_port_selector" "n253" {
  annotation       = local.m_253["annotation"]
  spine_profile_dn = local.m_253["spine_profile_dn"]
  tdn              = local.m_253["tdn"]
}
