# 327 · resource fmc_device_bridge_group_interface · 4. Devices
# This resource manages Device Bridge Group Interface, known also as BVI interfaces.
# Reads models/fmc_device_bridge_group_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_327 = yamldecode(file("${path.module}/../models/fmc_device_bridge_group_interface.yml"))["fmc_device_bridge_group_interface"]
}

resource "fmc_device_bridge_group_interface" "n327" {
  arp_table_entries              = local.m_327["arp_table_entries"]
  bridge_group_id                = local.m_327["bridge_group_id"]
  description                    = local.m_327["description"]
  device_id                      = local.m_327["device_id"]
  domain                         = local.m_327["domain"]
  ipv4_dhcp_obtain_default_route = local.m_327["ipv4_dhcp_obtain_default_route"]
  ipv4_static_address            = local.m_327["ipv4_static_address"]
  ipv4_static_netmask            = local.m_327["ipv4_static_netmask"]
  ipv6_addresses                 = local.m_327["ipv6_addresses"]
  ipv6_dad                       = local.m_327["ipv6_dad"]
  ipv6_dad_attempts              = local.m_327["ipv6_dad_attempts"]
  ipv6_ns_interval               = local.m_327["ipv6_ns_interval"]
  ipv6_reachable_time            = local.m_327["ipv6_reachable_time"]
  logical_name                   = local.m_327["logical_name"]
  selected_interfaces            = local.m_327["selected_interfaces"]
}
