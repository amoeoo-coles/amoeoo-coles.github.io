# 230 · data source aci_leaf_breakout_port_group · 2. Access policies
# Data source for ACI Leaf Breakout Port Group
# APIC class: not collected · DN: not collected
# Reads models/data_aci_leaf_breakout_port_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_230 = yamldecode(file("${path.module}/../models/data_aci_leaf_breakout_port_group.yml"))["data_aci_leaf_breakout_port_group"]
}

data "aci_leaf_breakout_port_group" "n230" {
  annotation  = local.m_230["annotation"]
  brkout_map  = local.m_230["brkout_map"]
  description = local.m_230["description"]
  name        = local.m_230["name"]
  name_alias  = local.m_230["name_alias"]
}

output "n230_data_aci_leaf_breakout_port_group_id" {
  value = data.aci_leaf_breakout_port_group.n230.id
}
