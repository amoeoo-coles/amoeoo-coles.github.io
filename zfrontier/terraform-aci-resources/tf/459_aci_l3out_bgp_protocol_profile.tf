# 459 · resource aci_l3out_bgp_protocol_profile · 3. Tenant and networking
# Manages ACI L3out BGP Protocol Profile
# APIC class: not collected · DN: not collected
# Reads models/aci_l3out_bgp_protocol_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_459 = yamldecode(file("${path.module}/../models/aci_l3out_bgp_protocol_profile.yml"))["aci_l3out_bgp_protocol_profile"]
}

resource "aci_l3out_bgp_protocol_profile" "n459" {
  annotation                         = local.m_459["annotation"]
  logical_node_profile_dn            = local.m_459["logical_node_profile_dn"]
  name                               = local.m_459["name"]
  name_alias                         = local.m_459["name_alias"]
  relation_bgp_rs_best_path_ctrl_pol = local.m_459["relation_bgp_rs_best_path_ctrl_pol"]
  relation_bgp_rs_bgp_node_ctx_pol   = local.m_459["relation_bgp_rs_bgp_node_ctx_pol"]
}
