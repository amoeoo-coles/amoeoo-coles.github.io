# 239 · resource sdwan_service_dhcp_server_feature · 7. Features: service
# This resource can manage a Service DHCP Server Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_service_dhcp_server_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_239 = yamldecode(file("${path.module}/../models/sdwan_service_dhcp_server_feature.yml"))["sdwan_service_dhcp_server_feature"]
}

resource "sdwan_service_dhcp_server_feature" "n239" {
  default_gateway          = local.m_239["default_gateway"]
  default_gateway_variable = local.m_239["default_gateway_variable"]
  description              = local.m_239["description"]
  dhcp_ha_enable           = local.m_239["dhcp_ha_enable"]
  dhcp_ha_enable_variable  = local.m_239["dhcp_ha_enable_variable"]
  dns_servers              = local.m_239["dns_servers"]
  dns_servers_variable     = local.m_239["dns_servers_variable"]
  domain_name              = local.m_239["domain_name"]
  domain_name_variable     = local.m_239["domain_name_variable"]
  exclude                  = local.m_239["exclude"]
  exclude_variable         = local.m_239["exclude_variable"]
  feature_profile_id       = local.m_239["feature_profile_id"]
  interface_mtu            = local.m_239["interface_mtu"]
  interface_mtu_variable   = local.m_239["interface_mtu_variable"]
  lease_time               = local.m_239["lease_time"]
  lease_time_variable      = local.m_239["lease_time_variable"]
  name                     = local.m_239["name"]
  network_address          = local.m_239["network_address"]
  network_address_variable = local.m_239["network_address_variable"]
  option_codes             = local.m_239["option_codes"]
  static_leases            = local.m_239["static_leases"]
  subnet_mask              = local.m_239["subnet_mask"]
  subnet_mask_variable     = local.m_239["subnet_mask_variable"]
  tftp_servers             = local.m_239["tftp_servers"]
  tftp_servers_variable    = local.m_239["tftp_servers_variable"]
}
