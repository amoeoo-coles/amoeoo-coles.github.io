# 428 · resource sdwan_cisco_dhcp_server_feature_template · 11. (Classic) feature templates
# This resource can manage a Cisco DHCP Server feature template. Minimum SD-WAN Manager version: 15.0.0
# Reads models/sdwan_cisco_dhcp_server_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_428 = yamldecode(file("${path.module}/../models/sdwan_cisco_dhcp_server_feature_template.yml"))["sdwan_cisco_dhcp_server_feature_template"]
}

resource "sdwan_cisco_dhcp_server_feature_template" "n428" {
  address_pool = local.m_428["address_pool"]
  address_pool_variable = local.m_428["address_pool_variable"]
  default_gateway = local.m_428["default_gateway"]
  default_gateway_variable = local.m_428["default_gateway_variable"]
  description = local.m_428["description"]
  device_types = local.m_428["device_types"]
  dns_servers = local.m_428["dns_servers"]
  dns_servers_variable = local.m_428["dns_servers_variable"]
  domain_name = local.m_428["domain_name"]
  domain_name_variable = local.m_428["domain_name_variable"]
  exclude_addresses = local.m_428["exclude_addresses"]
  exclude_addresses_variable = local.m_428["exclude_addresses_variable"]
  interface_mtu = local.m_428["interface_mtu"]
  interface_mtu_variable = local.m_428["interface_mtu_variable"]
  lease_time = local.m_428["lease_time"]
  lease_time_variable = local.m_428["lease_time_variable"]
  name = local.m_428["name"]
  options = local.m_428["options"]
  static_leases = local.m_428["static_leases"]
  tftp_servers = local.m_428["tftp_servers"]
  tftp_servers_variable = local.m_428["tftp_servers_variable"]
}
