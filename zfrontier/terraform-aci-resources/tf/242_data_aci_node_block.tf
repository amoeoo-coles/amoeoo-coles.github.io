# 242 · data source aci_node_block · 2. Access policies
# Data source for ACI Node Block
# APIC class: not collected · DN: not collected
# Reads models/data_aci_node_block.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_242 = yamldecode(file("${path.module}/../models/data_aci_node_block.yml"))["data_aci_node_block"]
}

data "aci_node_block" "n242" {
  annotation            = local.m_242["annotation"]
  description           = local.m_242["description"]
  from_                 = local.m_242["from_"]
  name                  = local.m_242["name"]
  name_alias            = local.m_242["name_alias"]
  switch_association_dn = local.m_242["switch_association_dn"]
  to_                   = local.m_242["to_"]
}

output "n242_data_aci_node_block_id" {
  value = data.aci_node_block.n242.id
}
