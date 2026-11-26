# 323 · resource sdwan_other_ucse_feature · 8. Features: CLI, topology, SIG, SSE and other
# This resource can manage a Other UCSE Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_other_ucse_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_323 = yamldecode(file("${path.module}/../models/sdwan_other_ucse_feature.yml"))["sdwan_other_ucse_feature"]
}

resource "sdwan_other_ucse_feature" "n323" {
  access_port_dedicated            = local.m_323["access_port_dedicated"]
  access_port_shared_failover_type = local.m_323["access_port_shared_failover_type"]
  access_port_shared_type          = local.m_323["access_port_shared_type"]
  assign_priority                  = local.m_323["assign_priority"]
  assign_priority_variable         = local.m_323["assign_priority_variable"]
  bay                              = local.m_323["bay"]
  default_gateway                  = local.m_323["default_gateway"]
  default_gateway_variable         = local.m_323["default_gateway_variable"]
  description                      = local.m_323["description"]
  feature_profile_id               = local.m_323["feature_profile_id"]
  interfaces                       = local.m_323["interfaces"]
  ipv4_address                     = local.m_323["ipv4_address"]
  ipv4_address_variable            = local.m_323["ipv4_address_variable"]
  name                             = local.m_323["name"]
  slot                             = local.m_323["slot"]
  vlan_id                          = local.m_323["vlan_id"]
  vlan_id_variable                 = local.m_323["vlan_id_variable"]
}
