# 169 · resource mso_fabric_policies_synce_interface_policy · 11. Fabric policy and resource templates
# Manages SyncE Interface Policies on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_fabric_policies_synce_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_169 = yamldecode(file("${path.module}/../models/mso_fabric_policies_synce_interface_policy.yml"))["mso_fabric_policies_synce_interface_policy"]
}

resource "mso_fabric_policies_synce_interface_policy" "n169" {
  admin_state     = local.m_169["admin_state"]
  description     = local.m_169["description"]
  name            = local.m_169["name"]
  selection_input = local.m_169["selection_input"]
  src_priority    = local.m_169["src_priority"]
  sync_state_msg  = local.m_169["sync_state_msg"]
  template_id     = local.m_169["template_id"]
  wait_to_restore = local.m_169["wait_to_restore"]
}
