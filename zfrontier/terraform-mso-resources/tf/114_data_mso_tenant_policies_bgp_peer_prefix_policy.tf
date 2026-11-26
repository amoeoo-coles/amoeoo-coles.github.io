# 114 · data source mso_tenant_policies_bgp_peer_prefix_policy · 10. Tenant policy templates
# Data source for BGP Peer Prefix Policy.
# Class: not collected · DN: not collected
# Reads models/data_mso_tenant_policies_bgp_peer_prefix_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_114 = yamldecode(file("${path.module}/../models/data_mso_tenant_policies_bgp_peer_prefix_policy.yml"))["data_mso_tenant_policies_bgp_peer_prefix_policy"]
}

data "mso_tenant_policies_bgp_peer_prefix_policy" "n114" {
  name        = local.m_114["name"]
  template_id = local.m_114["template_id"]
}

output "n114_data_mso_tenant_policies_bgp_peer_prefix_policy_id" {
  value = data.mso_tenant_policies_bgp_peer_prefix_policy.n114.id
}
