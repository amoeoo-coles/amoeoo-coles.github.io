# 364 · resource fmc_device_ospf_interface · 4. Devices
# This resource manages a Device OSPF Interface. The following restrictions apply: Minimum FMC version: 7.6
# Reads models/fmc_device_ospf_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_364 = yamldecode(file("${path.module}/../models/fmc_device_ospf_interface.yml"))["fmc_device_ospf_interface"]
}

resource "fmc_device_ospf_interface" "n364" {
  authentication_area_md5s     = local.m_364["authentication_area_md5s"]
  authentication_area_password = local.m_364["authentication_area_password"]
  authentication_key_chain_id  = local.m_364["authentication_key_chain_id"]
  authentication_md5s          = local.m_364["authentication_md5s"]
  authentication_password      = local.m_364["authentication_password"]
  bfd                          = local.m_364["bfd"]
  dead_interval                = local.m_364["dead_interval"]
  default_cost                 = local.m_364["default_cost"]
  device_id                    = local.m_364["device_id"]
  domain                       = local.m_364["domain"]
  hello_interval               = local.m_364["hello_interval"]
  hello_multiplier             = local.m_364["hello_multiplier"]
  interface_id                 = local.m_364["interface_id"]
  mtu_missmatch_ignore         = local.m_364["mtu_missmatch_ignore"]
  point_to_point               = local.m_364["point_to_point"]
  priority                     = local.m_364["priority"]
  retransmit_interval          = local.m_364["retransmit_interval"]
  transmit_delay               = local.m_364["transmit_delay"]
  vrf_id                       = local.m_364["vrf_id"]
}
