# 165 · resource mso_fabric_policies_ptp_policy · 11. Fabric policy and resource templates
# Manages PTP Policies on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_fabric_policies_ptp_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_165 = yamldecode(file("${path.module}/../models/mso_fabric_policies_ptp_policy.yml"))["mso_fabric_policies_ptp_policy"]
}

resource "mso_fabric_policies_ptp_policy" "n165" {
  admin_state              = local.m_165["admin_state"]
  description              = local.m_165["description"]
  fabric_announce_interval = local.m_165["fabric_announce_interval"]
  fabric_announce_timeout  = local.m_165["fabric_announce_timeout"]
  fabric_delay_interval    = local.m_165["fabric_delay_interval"]
  fabric_profile_template  = local.m_165["fabric_profile_template"]
  fabric_sync_interval     = local.m_165["fabric_sync_interval"]
  global_domain            = local.m_165["global_domain"]
  global_priority1         = local.m_165["global_priority1"]
  global_priority2         = local.m_165["global_priority2"]
  name                     = local.m_165["name"]
  template_id              = local.m_165["template_id"]
}
