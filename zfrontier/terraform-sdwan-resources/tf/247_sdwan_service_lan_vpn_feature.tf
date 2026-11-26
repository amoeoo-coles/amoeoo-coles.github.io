# 247 · resource sdwan_service_lan_vpn_feature · 7. Features: service
# This resource can manage a Service LAN VPN Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_service_lan_vpn_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_247 = yamldecode(file("${path.module}/../models/sdwan_service_lan_vpn_feature.yml"))["sdwan_service_lan_vpn_feature"]
}

resource "sdwan_service_lan_vpn_feature" "n247" {
  advertise_omp_ipv4s = local.m_247["advertise_omp_ipv4s"]
  advertise_omp_ipv6s = local.m_247["advertise_omp_ipv6s"]
  config_description = local.m_247["config_description"]
  config_description_variable = local.m_247["config_description_variable"]
  description = local.m_247["description"]
  enable_sdwan_remote_access = local.m_247["enable_sdwan_remote_access"]
  feature_profile_id = local.m_247["feature_profile_id"]
  gre_routes = local.m_247["gre_routes"]
  host_mappings = local.m_247["host_mappings"]
  ipsec_routes = local.m_247["ipsec_routes"]
  ipv4_export_route_targets = local.m_247["ipv4_export_route_targets"]
  ipv4_import_route_targets = local.m_247["ipv4_import_route_targets"]
  ipv4_static_routes = local.m_247["ipv4_static_routes"]
  ipv6_export_route_targets = local.m_247["ipv6_export_route_targets"]
  ipv6_import_route_targets = local.m_247["ipv6_import_route_targets"]
  ipv6_static_routes = local.m_247["ipv6_static_routes"]
  name = local.m_247["name"]
  nat_64_v4_pools = local.m_247["nat_64_v4_pools"]
  nat_pools = local.m_247["nat_pools"]
  nat_port_forwards = local.m_247["nat_port_forwards"]
  omp_admin_distance_ipv4 = local.m_247["omp_admin_distance_ipv4"]
  omp_admin_distance_ipv4_variable = local.m_247["omp_admin_distance_ipv4_variable"]
  omp_admin_distance_ipv6 = local.m_247["omp_admin_distance_ipv6"]
  omp_admin_distance_ipv6_variable = local.m_247["omp_admin_distance_ipv6_variable"]
  primary_dns_address_ipv4 = local.m_247["primary_dns_address_ipv4"]
  primary_dns_address_ipv4_variable = local.m_247["primary_dns_address_ipv4_variable"]
  primary_dns_address_ipv6 = local.m_247["primary_dns_address_ipv6"]
  primary_dns_address_ipv6_variable = local.m_247["primary_dns_address_ipv6_variable"]
  route_leak_from_global_vpns = local.m_247["route_leak_from_global_vpns"]
  route_leak_from_other_services = local.m_247["route_leak_from_other_services"]
  route_leak_to_global_vpns = local.m_247["route_leak_to_global_vpns"]
  secondary_dns_address_ipv4 = local.m_247["secondary_dns_address_ipv4"]
  secondary_dns_address_ipv4_variable = local.m_247["secondary_dns_address_ipv4_variable"]
  secondary_dns_address_ipv6 = local.m_247["secondary_dns_address_ipv6"]
  secondary_dns_address_ipv6_variable = local.m_247["secondary_dns_address_ipv6_variable"]
  service_routes = local.m_247["service_routes"]
  services = local.m_247["services"]
  static_nat_subnets = local.m_247["static_nat_subnets"]
  static_nats = local.m_247["static_nats"]
  vpn = local.m_247["vpn"]
  vpn_variable = local.m_247["vpn_variable"]
}
