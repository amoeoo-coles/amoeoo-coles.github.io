# 461 · resource aci_logical_interface_profile · 3. Tenant and networking
# Manages ACI Logical Interface Profile
# APIC class: not collected · DN: not collected
# Reads models/aci_logical_interface_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_461 = yamldecode(file("${path.module}/../models/aci_logical_interface_profile.yml"))["aci_logical_interface_profile"]
}

resource "aci_logical_interface_profile" "n461" {
  annotation                            = local.m_461["annotation"]
  description                           = local.m_461["description"]
  logical_node_profile_dn               = local.m_461["logical_node_profile_dn"]
  name                                  = local.m_461["name"]
  name_alias                            = local.m_461["name_alias"]
  prio                                  = local.m_461["prio"]
  relation_l3ext_rs_arp_if_pol          = local.m_461["relation_l3ext_rs_arp_if_pol"]
  relation_l3ext_rs_egress_qos_dpp_pol  = local.m_461["relation_l3ext_rs_egress_qos_dpp_pol"]
  relation_l3ext_rs_igmp_if_pol         = local.m_461["relation_l3ext_rs_igmp_if_pol"]
  relation_l3ext_rs_ingress_qos_dpp_pol = local.m_461["relation_l3ext_rs_ingress_qos_dpp_pol"]
  relation_l3ext_rs_l_if_p_cust_qos_pol = local.m_461["relation_l3ext_rs_l_if_p_cust_qos_pol"]
  relation_l3ext_rs_nd_if_pol           = local.m_461["relation_l3ext_rs_nd_if_pol"]
  relation_l3ext_rs_pim_ip_if_pol       = local.m_461["relation_l3ext_rs_pim_ip_if_pol"]
  relation_l3ext_rs_pim_ipv6_if_pol     = local.m_461["relation_l3ext_rs_pim_ipv6_if_pol"]
  tag                                   = local.m_461["tag"]
  dynamic "relation_l3ext_rs_l_if_p_to_netflow_monitor_pol" {
    for_each = local.m_461["relation_l3ext_rs_l_if_p_to_netflow_monitor_pol"] == null ? [] : local.m_461["relation_l3ext_rs_l_if_p_to_netflow_monitor_pol"]
    content {
      flt_type                    = lookup(relation_l3ext_rs_l_if_p_to_netflow_monitor_pol.value, "flt_type", null)
      tn_netflow_monitor_pol_dn   = lookup(relation_l3ext_rs_l_if_p_to_netflow_monitor_pol.value, "tn_netflow_monitor_pol_dn", null)
      tn_netflow_monitor_pol_name = lookup(relation_l3ext_rs_l_if_p_to_netflow_monitor_pol.value, "tn_netflow_monitor_pol_name", null)
    }
  }
}
