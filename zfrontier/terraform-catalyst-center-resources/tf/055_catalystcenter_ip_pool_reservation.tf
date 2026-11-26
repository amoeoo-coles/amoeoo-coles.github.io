# 055 · resource catalystcenter_ip_pool_reservation · 3. Network settings and tags
# This resource manages an IP reserve subpool using the new API schema.
# Reads models/catalystcenter_ip_pool_reservation.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_055 = yamldecode(file("${path.module}/../models/catalystcenter_ip_pool_reservation.yml"))["catalystcenter_ip_pool_reservation"]
}

resource "catalystcenter_ip_pool_reservation" "n055" {
  ipv4_assigned_addresses = local.m_055["ipv4_assigned_addresses"]
  ipv4_default_assigned_addresses = local.m_055["ipv4_default_assigned_addresses"]
  ipv4_dhcp_servers = local.m_055["ipv4_dhcp_servers"]
  ipv4_dns_servers = local.m_055["ipv4_dns_servers"]
  ipv4_gateway = local.m_055["ipv4_gateway"]
  ipv4_global_pool_id = local.m_055["ipv4_global_pool_id"]
  ipv4_prefix_length = local.m_055["ipv4_prefix_length"]
  ipv4_subnet = local.m_055["ipv4_subnet"]
  ipv4_total_addresses = local.m_055["ipv4_total_addresses"]
  ipv4_unassignable_addresses = local.m_055["ipv4_unassignable_addresses"]
  ipv6_assigned_addresses = local.m_055["ipv6_assigned_addresses"]
  ipv6_default_assigned_addresses = local.m_055["ipv6_default_assigned_addresses"]
  ipv6_dhcp_servers = local.m_055["ipv6_dhcp_servers"]
  ipv6_dns_servers = local.m_055["ipv6_dns_servers"]
  ipv6_gateway = local.m_055["ipv6_gateway"]
  ipv6_global_pool_id = local.m_055["ipv6_global_pool_id"]
  ipv6_prefix_length = local.m_055["ipv6_prefix_length"]
  ipv6_slaac_support = local.m_055["ipv6_slaac_support"]
  ipv6_subnet = local.m_055["ipv6_subnet"]
  ipv6_total_addresses = local.m_055["ipv6_total_addresses"]
  ipv6_unassignable_addresses = local.m_055["ipv6_unassignable_addresses"]
  name = local.m_055["name"]
  pool_type = local.m_055["pool_type"]
  site_id = local.m_055["site_id"]
}
