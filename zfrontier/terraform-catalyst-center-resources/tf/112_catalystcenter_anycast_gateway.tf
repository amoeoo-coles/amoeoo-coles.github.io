# 112 · resource catalystcenter_anycast_gateway · 7. SD-Access
# Manages Anycast Gateways
# Reads models/catalystcenter_anycast_gateway.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_112 = yamldecode(file("${path.module}/../models/catalystcenter_anycast_gateway.yml"))["catalystcenter_anycast_gateway"]
}

resource "catalystcenter_anycast_gateway" "n112" {
  additional_ip_pools = local.m_112["additional_ip_pools"]
  auto_generate_vlan_name = local.m_112["auto_generate_vlan_name"]
  critical_pool = local.m_112["critical_pool"]
  fabric_id = local.m_112["fabric_id"]
  group_based_policy_enforcement_enabled = local.m_112["group_based_policy_enforcement_enabled"]
  intra_subnet_routing_enabled = local.m_112["intra_subnet_routing_enabled"]
  ip_directed_broadcast = local.m_112["ip_directed_broadcast"]
  ip_pool_name = local.m_112["ip_pool_name"]
  l2_flooding_enabled = local.m_112["l2_flooding_enabled"]
  multiple_ip_to_mac_addresses = local.m_112["multiple_ip_to_mac_addresses"]
  pool_type = local.m_112["pool_type"]
  security_group_name = local.m_112["security_group_name"]
  supplicant_based_extended_node_onboarding = local.m_112["supplicant_based_extended_node_onboarding"]
  tcp_mss_adjustment = local.m_112["tcp_mss_adjustment"]
  traffic_type = local.m_112["traffic_type"]
  virtual_network_name = local.m_112["virtual_network_name"]
  vlan_id = local.m_112["vlan_id"]
  vlan_name = local.m_112["vlan_name"]
  wireless_flooding_enabled = local.m_112["wireless_flooding_enabled"]
  wireless_pool = local.m_112["wireless_pool"]
}
