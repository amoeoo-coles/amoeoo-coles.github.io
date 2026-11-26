# 475 · resource aci_l3out_floating_svi · 3. Tenant and networking
# Manages ACI L3out Floating SVI
# APIC class: not collected · DN: not collected
# Reads models/aci_l3out_floating_svi.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_475 = yamldecode(file("${path.module}/../models/aci_l3out_floating_svi.yml"))["aci_l3out_floating_svi"]
}

resource "aci_l3out_floating_svi" "n475" {
  addr                         = local.m_475["addr"]
  annotation                   = local.m_475["annotation"]
  autostate                    = local.m_475["autostate"]
  description                  = local.m_475["description"]
  encap                        = local.m_475["encap"]
  encap_scope                  = local.m_475["encap_scope"]
  if_inst_t                    = local.m_475["if_inst_t"]
  ipv6_dad                     = local.m_475["ipv6_dad"]
  ll_addr                      = local.m_475["ll_addr"]
  logical_interface_profile_dn = local.m_475["logical_interface_profile_dn"]
  mac                          = local.m_475["mac"]
  mode                         = local.m_475["mode"]
  mtu                          = local.m_475["mtu"]
  node_dn                      = local.m_475["node_dn"]
  target_dscp                  = local.m_475["target_dscp"]
  dynamic "relation_l3ext_rs_dyn_path_att" {
    for_each = local.m_475["relation_l3ext_rs_dyn_path_att"] == null ? [] : local.m_475["relation_l3ext_rs_dyn_path_att"]
    content {
      encap                  = lookup(relation_l3ext_rs_dyn_path_att.value, "encap", null)
      enhanced_lag_policy_dn = lookup(relation_l3ext_rs_dyn_path_att.value, "enhanced_lag_policy_dn", null)
      floating_address       = lookup(relation_l3ext_rs_dyn_path_att.value, "floating_address", null)
      forged_transmit        = lookup(relation_l3ext_rs_dyn_path_att.value, "forged_transmit", null)
      mac_change             = lookup(relation_l3ext_rs_dyn_path_att.value, "mac_change", null)
      promiscuous_mode       = lookup(relation_l3ext_rs_dyn_path_att.value, "promiscuous_mode", null)
      tdn                    = lookup(relation_l3ext_rs_dyn_path_att.value, "tdn", null)
    }
  }
}
