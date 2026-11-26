# 206 · data source aci_access_sub_port_block · 2. Access policies
# Data source for ACI Access Sub Port Block
# APIC class: not collected · DN: not collected
# Reads models/data_aci_access_sub_port_block.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_206 = yamldecode(file("${path.module}/../models/data_aci_access_sub_port_block.yml"))["data_aci_access_sub_port_block"]
}

data "aci_access_sub_port_block" "n206" {
  access_port_selector_dn = local.m_206["access_port_selector_dn"]
  annotation              = local.m_206["annotation"]
  description             = local.m_206["description"]
  from_card               = local.m_206["from_card"]
  from_port               = local.m_206["from_port"]
  from_sub_port           = local.m_206["from_sub_port"]
  name                    = local.m_206["name"]
  name_alias              = local.m_206["name_alias"]
  to_card                 = local.m_206["to_card"]
  to_port                 = local.m_206["to_port"]
  to_sub_port             = local.m_206["to_sub_port"]
}

output "n206_data_aci_access_sub_port_block_id" {
  value = data.aci_access_sub_port_block.n206.id
}
