# 151 · resource aci_l2_interface_policy · 2. Access policies
# Manages ACI L2 Interface Policy
# APIC class: l2IfPol · DN: uni/infra/l2IfP-{name}
# Reads models/aci_l2_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_151 = yamldecode(file("${path.module}/../models/aci_l2_interface_policy.yml"))["aci_l2_interface_policy"]
}

resource "aci_l2_interface_policy" "n151" {
  annotation       = local.m_151["annotation"]
  annotations      = local.m_151["annotations"]
  description      = local.m_151["description"]
  name             = local.m_151["name"]
  name_alias       = local.m_151["name_alias"]
  owner_key        = local.m_151["owner_key"]
  owner_tag        = local.m_151["owner_tag"]
  q_in_q           = local.m_151["q_in_q"]
  qinq             = local.m_151["qinq"]
  reflective_relay = local.m_151["reflective_relay"]
  tags             = local.m_151["tags"]
  vepa             = local.m_151["vepa"]
  vlan_scope       = local.m_151["vlan_scope"]
}
