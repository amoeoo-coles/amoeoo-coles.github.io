# 247 · resource aci_ranges · 2. Access policies
# Manages ACI VLAN Pool Ranges
# APIC class: not collected · DN: not collected
# Reads models/aci_ranges.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_247 = yamldecode(file("${path.module}/../models/aci_ranges.yml"))["aci_ranges"]
}

resource "aci_ranges" "n247" {
  alloc_mode   = local.m_247["alloc_mode"]
  annotation   = local.m_247["annotation"]
  description  = local.m_247["description"]
  from         = local.m_247["from"]
  name_alias   = local.m_247["name_alias"]
  role         = local.m_247["role"]
  to           = local.m_247["to"]
  vlan_pool_dn = local.m_247["vlan_pool_dn"]
}
