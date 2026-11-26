# 500 · data source aci_bgp_peer_connectivity_profile · 3. Tenant and networking
# Data source for ACI BGP Peer Connectivity Profile
# APIC class: not collected · DN: not collected
# Reads models/data_aci_bgp_peer_connectivity_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_500 = yamldecode(file("${path.module}/../models/data_aci_bgp_peer_connectivity_profile.yml"))["data_aci_bgp_peer_connectivity_profile"]
}

data "aci_bgp_peer_connectivity_profile" "n500" {
  addr                    = local.m_500["addr"]
  addr_t_ctrl             = local.m_500["addr_t_ctrl"]
  allowed_self_as_cnt     = local.m_500["allowed_self_as_cnt"]
  annotation              = local.m_500["annotation"]
  as_number               = local.m_500["as_number"]
  ctrl                    = local.m_500["ctrl"]
  description             = local.m_500["description"]
  local_asn               = local.m_500["local_asn"]
  local_asn_propagate     = local.m_500["local_asn_propagate"]
  logical_node_profile_dn = local.m_500["logical_node_profile_dn"]
  name_alias              = local.m_500["name_alias"]
  parent_dn               = local.m_500["parent_dn"]
  password                = local.m_500["password"]
  peer_ctrl               = local.m_500["peer_ctrl"]
  private_a_sctrl         = local.m_500["private_a_sctrl"]
  ttl                     = local.m_500["ttl"]
  weight                  = local.m_500["weight"]
}

output "n500_data_aci_bgp_peer_connectivity_profile_id" {
  value = data.aci_bgp_peer_connectivity_profile.n500.id
}
