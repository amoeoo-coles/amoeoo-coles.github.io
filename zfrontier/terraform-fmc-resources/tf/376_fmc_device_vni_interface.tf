# 376 · resource fmc_device_vni_interface · 4. Devices
# This resource manages a Device VNI Interface.
# Reads models/fmc_device_vni_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_376 = yamldecode(file("${path.module}/../models/fmc_device_vni_interface.yml"))["fmc_device_vni_interface"]
}

resource "fmc_device_vni_interface" "n376" {
  active_mac_address = local.m_376["active_mac_address"]
  description = local.m_376["description"]
  device_id = local.m_376["device_id"]
  domain = local.m_376["domain"]
  enabled = local.m_376["enabled"]
  ipv4_dhcp_default_route_metric = local.m_376["ipv4_dhcp_default_route_metric"]
  ipv4_dhcp_obtain_default_route = local.m_376["ipv4_dhcp_obtain_default_route"]
  ipv4_static_address = local.m_376["ipv4_static_address"]
  ipv4_static_netmask = local.m_376["ipv4_static_netmask"]
  ipv6 = local.m_376["ipv6"]
  ipv6_addresses = local.m_376["ipv6_addresses"]
  ipv6_auto_config = local.m_376["ipv6_auto_config"]
  ipv6_dhcp_address = local.m_376["ipv6_dhcp_address"]
  ipv6_dhcp_nonaddress = local.m_376["ipv6_dhcp_nonaddress"]
  ipv6_enforce_eui = local.m_376["ipv6_enforce_eui"]
  ipv6_ra = local.m_376["ipv6_ra"]
  logical_name = local.m_376["logical_name"]
  mtu = local.m_376["mtu"]
  multicast_group_address = local.m_376["multicast_group_address"]
  nve_number = local.m_376["nve_number"]
  priority = local.m_376["priority"]
  proxy = local.m_376["proxy"]
  proxy_type = local.m_376["proxy_type"]
  security_zone_id = local.m_376["security_zone_id"]
  segment_id = local.m_376["segment_id"]
  standby_mac_address = local.m_376["standby_mac_address"]
  vni_id = local.m_376["vni_id"]
}
