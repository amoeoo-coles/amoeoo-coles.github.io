# 203 · resource aci_access_port_block · 2. Access policies
# Manages ACI Access Port Block
# APIC class: infraPortBlk · DN: uni/infra/accportprof-{name}/hports-{name}-typ-{type}/portblk-{name} | uni/infra/fexprof-{name}/hports-{name}-typ-{type}/portblk-{name} | uni/infra/spaccportprof-{name}/shports-{name}-typ-{type}/portblk-{name}
# Reads models/aci_access_port_block.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_203 = yamldecode(file("${path.module}/../models/aci_access_port_block.yml"))["aci_access_port_block"]
}

resource "aci_access_port_block" "n203" {
  access_port_selector_dn            = local.m_203["access_port_selector_dn"]
  annotation                         = local.m_203["annotation"]
  annotations                        = local.m_203["annotations"]
  description                        = local.m_203["description"]
  from_card                          = local.m_203["from_card"]
  from_port                          = local.m_203["from_port"]
  name                               = local.m_203["name"]
  name_alias                         = local.m_203["name_alias"]
  parent_dn                          = local.m_203["parent_dn"]
  relation_infra_rs_acc_bndl_subgrp  = local.m_203["relation_infra_rs_acc_bndl_subgrp"]
  relation_to_pc_vpc_override_policy = local.m_203["relation_to_pc_vpc_override_policy"]
  tags                               = local.m_203["tags"]
  to_card                            = local.m_203["to_card"]
  to_port                            = local.m_203["to_port"]
}
