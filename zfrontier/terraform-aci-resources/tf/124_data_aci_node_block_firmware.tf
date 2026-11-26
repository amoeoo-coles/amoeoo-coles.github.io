# 124 · data source aci_node_block_firmware · 1. System and fabric setup
# Data source for ACI Node Block
# APIC class: not collected · DN: not collected
# Reads models/data_aci_node_block_firmware.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_124 = yamldecode(file("${path.module}/../models/data_aci_node_block_firmware.yml"))["data_aci_node_block_firmware"]
}

data "aci_node_block_firmware" "n124" {
  annotation        = local.m_124["annotation"]
  description       = local.m_124["description"]
  firmware_group_dn = local.m_124["firmware_group_dn"]
  from_             = local.m_124["from_"]
  name              = local.m_124["name"]
  name_alias        = local.m_124["name_alias"]
  to_               = local.m_124["to_"]
}

output "n124_data_aci_node_block_firmware_id" {
  value = data.aci_node_block_firmware.n124.id
}
