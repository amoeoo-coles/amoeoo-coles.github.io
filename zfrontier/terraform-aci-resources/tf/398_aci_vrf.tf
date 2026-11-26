# 398 · resource aci_vrf · 3. Tenant and networking
# Manages ACI VRF
# APIC class: fvCtx · DN: uni/tn-{name}/ctx-{name}
# Reads models/aci_vrf.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_398 = yamldecode(file("${path.module}/../models/aci_vrf.yml"))["aci_vrf"]
}

resource "aci_vrf" "n398" {
  annotation                                = local.m_398["annotation"]
  annotations                               = local.m_398["annotations"]
  bd_enforced_enable                        = local.m_398["bd_enforced_enable"]
  bd_enforcement                            = local.m_398["bd_enforcement"]
  description                               = local.m_398["description"]
  ip_data_plane_learning                    = local.m_398["ip_data_plane_learning"]
  knw_mcast_act                             = local.m_398["knw_mcast_act"]
  name                                      = local.m_398["name"]
  name_alias                                = local.m_398["name_alias"]
  owner_key                                 = local.m_398["owner_key"]
  owner_tag                                 = local.m_398["owner_tag"]
  parent_dn                                 = local.m_398["parent_dn"]
  pc_enf_dir                                = local.m_398["pc_enf_dir"]
  pc_enf_pref                               = local.m_398["pc_enf_pref"]
  policy_control_enforcement_direction      = local.m_398["policy_control_enforcement_direction"]
  policy_control_enforcement_mode           = local.m_398["policy_control_enforcement_mode"]
  relation_fv_rs_bgp_ctx_pol                = local.m_398["relation_fv_rs_bgp_ctx_pol"]
  relation_fv_rs_ctx_mcast_to               = local.m_398["relation_fv_rs_ctx_mcast_to"]
  relation_fv_rs_ctx_mon_pol                = local.m_398["relation_fv_rs_ctx_mon_pol"]
  relation_fv_rs_ctx_to_ep_ret              = local.m_398["relation_fv_rs_ctx_to_ep_ret"]
  relation_fv_rs_ctx_to_ext_route_tag_pol   = local.m_398["relation_fv_rs_ctx_to_ext_route_tag_pol"]
  relation_fv_rs_ospf_ctx_pol               = local.m_398["relation_fv_rs_ospf_ctx_pol"]
  relation_fv_rs_vrf_validation_pol         = local.m_398["relation_fv_rs_vrf_validation_pol"]
  relation_to_address_family_ospf_timers    = local.m_398["relation_to_address_family_ospf_timers"]
  relation_to_bgp_address_family_contexts   = local.m_398["relation_to_bgp_address_family_contexts"]
  relation_to_bgp_timers                    = local.m_398["relation_to_bgp_timers"]
  relation_to_eigrp_address_family_contexts = local.m_398["relation_to_eigrp_address_family_contexts"]
  relation_to_end_point_retention_policy    = local.m_398["relation_to_end_point_retention_policy"]
  relation_to_l3out_route_tag_policy        = local.m_398["relation_to_l3out_route_tag_policy"]
  relation_to_monitoring_policy             = local.m_398["relation_to_monitoring_policy"]
  relation_to_ospf_timers                   = local.m_398["relation_to_ospf_timers"]
  relation_to_wan_vpn                       = local.m_398["relation_to_wan_vpn"]
  tags                                      = local.m_398["tags"]
  tenant_dn                                 = local.m_398["tenant_dn"]
  dynamic "relation_fv_rs_ctx_to_bgp_ctx_af_pol" {
    for_each = local.m_398["relation_fv_rs_ctx_to_bgp_ctx_af_pol"] == null ? [] : local.m_398["relation_fv_rs_ctx_to_bgp_ctx_af_pol"]
    content {
      af                     = lookup(relation_fv_rs_ctx_to_bgp_ctx_af_pol.value, "af", null)
      tn_bgp_ctx_af_pol_name = lookup(relation_fv_rs_ctx_to_bgp_ctx_af_pol.value, "tn_bgp_ctx_af_pol_name", null)
    }
  }
  dynamic "relation_fv_rs_ctx_to_eigrp_ctx_af_pol" {
    for_each = local.m_398["relation_fv_rs_ctx_to_eigrp_ctx_af_pol"] == null ? [] : local.m_398["relation_fv_rs_ctx_to_eigrp_ctx_af_pol"]
    content {
      af                       = lookup(relation_fv_rs_ctx_to_eigrp_ctx_af_pol.value, "af", null)
      tn_eigrp_ctx_af_pol_name = lookup(relation_fv_rs_ctx_to_eigrp_ctx_af_pol.value, "tn_eigrp_ctx_af_pol_name", null)
    }
  }
  dynamic "relation_fv_rs_ctx_to_ospf_ctx_pol" {
    for_each = local.m_398["relation_fv_rs_ctx_to_ospf_ctx_pol"] == null ? [] : local.m_398["relation_fv_rs_ctx_to_ospf_ctx_pol"]
    content {
      af                   = lookup(relation_fv_rs_ctx_to_ospf_ctx_pol.value, "af", null)
      tn_ospf_ctx_pol_name = lookup(relation_fv_rs_ctx_to_ospf_ctx_pol.value, "tn_ospf_ctx_pol_name", null)
    }
  }
}
