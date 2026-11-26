# 311 · resource fmc_chassis_etherchannel_interface · 4. Devices
# This resource manages a Chassis EtherChannel Interface.
# Reads models/fmc_chassis_etherchannel_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_311 = yamldecode(file("${path.module}/../models/fmc_chassis_etherchannel_interface.yml"))["fmc_chassis_etherchannel_interface"]
}

resource "fmc_chassis_etherchannel_interface" "n311" {
  admin_state = local.m_311["admin_state"]
  auto_negotiation = local.m_311["auto_negotiation"]
  chassis_id = local.m_311["chassis_id"]
  domain = local.m_311["domain"]
  duplex = local.m_311["duplex"]
  ether_channel_id = local.m_311["ether_channel_id"]
  lacp_mode = local.m_311["lacp_mode"]
  lacp_rate = local.m_311["lacp_rate"]
  port_type = local.m_311["port_type"]
  selected_interfaces = local.m_311["selected_interfaces"]
  speed = local.m_311["speed"]
}
