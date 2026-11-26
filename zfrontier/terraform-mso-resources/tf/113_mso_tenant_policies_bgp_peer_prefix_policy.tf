# 113 · resource mso_tenant_policies_bgp_peer_prefix_policy · 10. Tenant policy templates
# Manages BGP Peer Prefix Policies on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_tenant_policies_bgp_peer_prefix_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_113 = yamldecode(file("${path.module}/../models/mso_tenant_policies_bgp_peer_prefix_policy.yml"))["mso_tenant_policies_bgp_peer_prefix_policy"]
}

resource "mso_tenant_policies_bgp_peer_prefix_policy" "n113" {
  action                 = local.m_113["action"]
  description            = local.m_113["description"]
  max_number_of_prefixes = local.m_113["max_number_of_prefixes"]
  name                   = local.m_113["name"]
  restart_time           = local.m_113["restart_time"]
  template_id            = local.m_113["template_id"]
  threshold_percentage   = local.m_113["threshold_percentage"]
}
