# 179 · resource aci_synce_interface_policy · 2. Access policies
# Manages ACI SyncE Interface Policy
# APIC class: synceEthIfPol · DN: uni/infra/synceEthIfP-{name}
# Reads models/aci_synce_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_179 = yamldecode(file("${path.module}/../models/aci_synce_interface_policy.yml"))["aci_synce_interface_policy"]
}

resource "aci_synce_interface_policy" "n179" {
  admin_state                    = local.m_179["admin_state"]
  annotation                     = local.m_179["annotation"]
  annotations                    = local.m_179["annotations"]
  description                    = local.m_179["description"]
  name                           = local.m_179["name"]
  name_alias                     = local.m_179["name_alias"]
  owner_key                      = local.m_179["owner_key"]
  owner_tag                      = local.m_179["owner_tag"]
  quality_level_options          = local.m_179["quality_level_options"]
  quality_receive_exact_value    = local.m_179["quality_receive_exact_value"]
  quality_receive_highest_value  = local.m_179["quality_receive_highest_value"]
  quality_receive_lowest_value   = local.m_179["quality_receive_lowest_value"]
  quality_transmit_exact_value   = local.m_179["quality_transmit_exact_value"]
  quality_transmit_highest_value = local.m_179["quality_transmit_highest_value"]
  quality_transmit_lowest_value  = local.m_179["quality_transmit_lowest_value"]
  selection_input                = local.m_179["selection_input"]
  source_priority                = local.m_179["source_priority"]
  synchronization_status_message = local.m_179["synchronization_status_message"]
  tags                           = local.m_179["tags"]
  wait_to_restore_time           = local.m_179["wait_to_restore_time"]
}
