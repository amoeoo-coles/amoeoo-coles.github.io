# 372 · resource fmc_device_virtual_tunnel_interface · 4. Devices
# This device manages Device Virtual Tunnel Interface (VTI) configuration. The following applies: Ipv4 address configured on tunnel source interface is taken by default. This can be overriden by tunnel_source_interface_ipv6_address.Either IPv4 or IPv6 or borrow_ip_interface is required, which needs 
# Reads models/fmc_device_virtual_tunnel_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_372 = yamldecode(file("${path.module}/../models/fmc_device_virtual_tunnel_interface.yml"))["fmc_device_virtual_tunnel_interface"]
}

resource "fmc_device_virtual_tunnel_interface" "n372" {
  borrow_ip_interface_id               = local.m_372["borrow_ip_interface_id"]
  borrow_ip_interface_name             = local.m_372["borrow_ip_interface_name"]
  description                          = local.m_372["description"]
  device_id                            = local.m_372["device_id"]
  domain                               = local.m_372["domain"]
  enabled                              = local.m_372["enabled"]
  http_based_application_monitoring    = local.m_372["http_based_application_monitoring"]
  ip_based_monitoring                  = local.m_372["ip_based_monitoring"]
  ip_based_monitoring_peer_ip          = local.m_372["ip_based_monitoring_peer_ip"]
  ip_based_monitoring_type             = local.m_372["ip_based_monitoring_type"]
  ipv4_static_address                  = local.m_372["ipv4_static_address"]
  ipv4_static_netmask                  = local.m_372["ipv4_static_netmask"]
  ipv6_address                         = local.m_372["ipv6_address"]
  ipv6_prefix                          = local.m_372["ipv6_prefix"]
  logical_name                         = local.m_372["logical_name"]
  priority                             = local.m_372["priority"]
  security_zone_id                     = local.m_372["security_zone_id"]
  tunnel_id                            = local.m_372["tunnel_id"]
  tunnel_mode                          = local.m_372["tunnel_mode"]
  tunnel_source_interface_id           = local.m_372["tunnel_source_interface_id"]
  tunnel_source_interface_ipv6_address = local.m_372["tunnel_source_interface_ipv6_address"]
  tunnel_source_interface_name         = local.m_372["tunnel_source_interface_name"]
  tunnel_type                          = local.m_372["tunnel_type"]
}
