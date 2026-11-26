# 167 · resource mso_fabric_policies_ptp_policy_profile · 11. Fabric policy and resource templates
# Manages PTP Policy Profiles on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_fabric_policies_ptp_policy_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_167 = yamldecode(file("${path.module}/../models/mso_fabric_policies_ptp_policy_profile.yml"))["mso_fabric_policies_ptp_policy_profile"]
}

resource "mso_fabric_policies_ptp_policy_profile" "n167" {
  announce_interval       = local.m_167["announce_interval"]
  announce_timeout        = local.m_167["announce_timeout"]
  delay_interval          = local.m_167["delay_interval"]
  destination_mac_type    = local.m_167["destination_mac_type"]
  local_priority          = local.m_167["local_priority"]
  mismatched_mac_handling = local.m_167["mismatched_mac_handling"]
  name                    = local.m_167["name"]
  override_node_profile   = local.m_167["override_node_profile"]
  profile_template        = local.m_167["profile_template"]
  ptp_policy_uuid         = local.m_167["ptp_policy_uuid"]
  sync_interval           = local.m_167["sync_interval"]
  template_id             = local.m_167["template_id"]
}
