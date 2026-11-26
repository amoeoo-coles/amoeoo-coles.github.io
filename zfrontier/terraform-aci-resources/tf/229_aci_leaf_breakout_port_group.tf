# 229 · resource aci_leaf_breakout_port_group · 2. Access policies
# Manages ACI Leaf Breakout Port Group
# APIC class: not collected · DN: not collected
# Reads models/aci_leaf_breakout_port_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_229 = yamldecode(file("${path.module}/../models/aci_leaf_breakout_port_group.yml"))["aci_leaf_breakout_port_group"]
}

resource "aci_leaf_breakout_port_group" "n229" {
  annotation                             = local.m_229["annotation"]
  brkout_map                             = local.m_229["brkout_map"]
  description                            = local.m_229["description"]
  name                                   = local.m_229["name"]
  name_alias                             = local.m_229["name_alias"]
  relation_infra_rs_mon_brkout_infra_pol = local.m_229["relation_infra_rs_mon_brkout_infra_pol"]
}
