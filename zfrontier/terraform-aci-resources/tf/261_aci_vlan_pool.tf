# 261 · resource aci_vlan_pool · 2. Access policies
# Manages ACI VLAN Pool
# APIC class: not collected · DN: not collected
# Reads models/aci_vlan_pool.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_261 = yamldecode(file("${path.module}/../models/aci_vlan_pool.yml"))["aci_vlan_pool"]
}

resource "aci_vlan_pool" "n261" {
  alloc_mode  = local.m_261["alloc_mode"]
  annotation  = local.m_261["annotation"]
  description = local.m_261["description"]
  name        = local.m_261["name"]
  name_alias  = local.m_261["name_alias"]
}
