# 454 · resource sdwan_cisco_vpn_feature_template · 11. (Classic) feature templates
# This resource can manage a Cisco VPN feature template. Minimum SD-WAN Manager version: 15.0.0
# Reads models/sdwan_cisco_vpn_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_454 = yamldecode(file("${path.module}/../models/sdwan_cisco_vpn_feature_template.yml"))["sdwan_cisco_vpn_feature_template"]
}

resource "sdwan_cisco_vpn_feature_template" "n454" {
  description = local.m_454["description"]
  device_types = local.m_454["device_types"]
  dns_hosts = local.m_454["dns_hosts"]
  dns_ipv4_servers = local.m_454["dns_ipv4_servers"]
  dns_ipv6_servers = local.m_454["dns_ipv6_servers"]
  enhance_ecmp_keying = local.m_454["enhance_ecmp_keying"]
  enhance_ecmp_keying_variable = local.m_454["enhance_ecmp_keying_variable"]
  ipv4_static_gre_routes = local.m_454["ipv4_static_gre_routes"]
  ipv4_static_ipsec_routes = local.m_454["ipv4_static_ipsec_routes"]
  ipv4_static_routes = local.m_454["ipv4_static_routes"]
  ipv4_static_service_routes = local.m_454["ipv4_static_service_routes"]
  ipv6_static_routes = local.m_454["ipv6_static_routes"]
  name = local.m_454["name"]
  nat64_pools = local.m_454["nat64_pools"]
  nat_pools = local.m_454["nat_pools"]
  omp_admin_distance_ipv4 = local.m_454["omp_admin_distance_ipv4"]
  omp_admin_distance_ipv4_variable = local.m_454["omp_admin_distance_ipv4_variable"]
  omp_admin_distance_ipv6 = local.m_454["omp_admin_distance_ipv6"]
  omp_admin_distance_ipv6_variable = local.m_454["omp_admin_distance_ipv6_variable"]
  omp_advertise_ipv4_routes = local.m_454["omp_advertise_ipv4_routes"]
  omp_advertise_ipv6_routes = local.m_454["omp_advertise_ipv6_routes"]
  organization_name = local.m_454["organization_name"]
  port_forward_rules = local.m_454["port_forward_rules"]
  route_global_exports = local.m_454["route_global_exports"]
  route_global_imports = local.m_454["route_global_imports"]
  route_vpn_imports = local.m_454["route_vpn_imports"]
  services = local.m_454["services"]
  static_nat_rules = local.m_454["static_nat_rules"]
  static_nat_subnet_rules = local.m_454["static_nat_subnet_rules"]
  tenant_vpn_id = local.m_454["tenant_vpn_id"]
  vpn_id = local.m_454["vpn_id"]
  vpn_name = local.m_454["vpn_name"]
  vpn_name_variable = local.m_454["vpn_name_variable"]
}
