# 240 · data source aci_multicast_pool_block · 2. Access policies
# Data source for the ACI Multicast Address Pool Block
# APIC class: not collected · DN: not collected
# Reads models/data_aci_multicast_pool_block.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_240 = yamldecode(file("${path.module}/../models/data_aci_multicast_pool_block.yml"))["data_aci_multicast_pool_block"]
}

data "aci_multicast_pool_block" "n240" {
  annotation        = local.m_240["annotation"]
  description       = local.m_240["description"]
  from              = local.m_240["from"]
  multicast_pool_dn = local.m_240["multicast_pool_dn"]
  name              = local.m_240["name"]
  name_alias        = local.m_240["name_alias"]
  to                = local.m_240["to"]
}

output "n240_data_aci_multicast_pool_block_id" {
  value = data.aci_multicast_pool_block.n240.id
}
