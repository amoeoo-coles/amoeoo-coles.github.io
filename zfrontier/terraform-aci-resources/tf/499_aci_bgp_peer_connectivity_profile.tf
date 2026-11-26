# 499 · resource aci_bgp_peer_connectivity_profile · 3. Tenant and networking
# Manages ACI BGP Peer Connectivity Profile
# APIC class: not collected · DN: not collected
# Reads models/aci_bgp_peer_connectivity_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_499 = yamldecode(file("${path.module}/../models/aci_bgp_peer_connectivity_profile.yml"))["aci_bgp_peer_connectivity_profile"]
}

resource "aci_bgp_peer_connectivity_profile" "n499" {
  addr                         = local.m_499["addr"]
  addr_t_ctrl                  = local.m_499["addr_t_ctrl"]
  admin_state                  = local.m_499["admin_state"]
  allowed_self_as_cnt          = local.m_499["allowed_self_as_cnt"]
  annotation                   = local.m_499["annotation"]
  as_number                    = local.m_499["as_number"]
  ctrl                         = local.m_499["ctrl"]
  description                  = local.m_499["description"]
  local_asn                    = local.m_499["local_asn"]
  local_asn_propagate          = local.m_499["local_asn_propagate"]
  logical_node_profile_dn      = local.m_499["logical_node_profile_dn"]
  name_alias                   = local.m_499["name_alias"]
  parent_dn                    = local.m_499["parent_dn"]
  password                     = local.m_499["password"]
  peer_ctrl                    = local.m_499["peer_ctrl"]
  private_a_sctrl              = local.m_499["private_a_sctrl"]
  relation_bgp_rs_peer_pfx_pol = local.m_499["relation_bgp_rs_peer_pfx_pol"]
  ttl                          = local.m_499["ttl"]
  weight                       = local.m_499["weight"]
  dynamic "relation_bgp_rs_peer_to_profile" {
    for_each = local.m_499["relation_bgp_rs_peer_to_profile"] == null ? [] : local.m_499["relation_bgp_rs_peer_to_profile"]
    content {
      direction = lookup(relation_bgp_rs_peer_to_profile.value, "direction", null)
      target_dn = lookup(relation_bgp_rs_peer_to_profile.value, "target_dn", null)
    }
  }
}
