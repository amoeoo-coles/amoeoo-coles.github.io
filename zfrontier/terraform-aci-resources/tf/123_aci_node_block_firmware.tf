# 123 · resource aci_node_block_firmware · 1. System and fabric setup
# Manages ACI Node Block
# APIC class: not collected · DN: not collected
# Reads models/aci_node_block_firmware.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_123 = yamldecode(file("${path.module}/../models/aci_node_block_firmware.yml"))["aci_node_block_firmware"]
}

resource "aci_node_block_firmware" "n123" {
  annotation        = local.m_123["annotation"]
  description       = local.m_123["description"]
  firmware_group_dn = local.m_123["firmware_group_dn"]
  from_             = local.m_123["from_"]
  name              = local.m_123["name"]
  name_alias        = local.m_123["name_alias"]
  to_               = local.m_123["to_"]
}
