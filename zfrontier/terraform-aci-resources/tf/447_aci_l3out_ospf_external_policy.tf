# 447 · resource aci_l3out_ospf_external_policy · 3. Tenant and networking
# Manages ACI L3-out OSPF External Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_l3out_ospf_external_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_447 = yamldecode(file("${path.module}/../models/aci_l3out_ospf_external_policy.yml"))["aci_l3out_ospf_external_policy"]
}

resource "aci_l3out_ospf_external_policy" "n447" {
  annotation        = local.m_447["annotation"]
  area_cost         = local.m_447["area_cost"]
  area_ctrl         = local.m_447["area_ctrl"]
  area_id           = local.m_447["area_id"]
  area_type         = local.m_447["area_type"]
  description       = local.m_447["description"]
  l3_outside_dn     = local.m_447["l3_outside_dn"]
  multipod_internal = local.m_447["multipod_internal"]
  name_alias        = local.m_447["name_alias"]
}
