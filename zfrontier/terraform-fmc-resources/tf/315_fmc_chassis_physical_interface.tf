# 315 · resource fmc_chassis_physical_interface · 4. Devices
# This resource manages a Chassis Physical Interface.
# Reads models/fmc_chassis_physical_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_315 = yamldecode(file("${path.module}/../models/fmc_chassis_physical_interface.yml"))["fmc_chassis_physical_interface"]
}

resource "fmc_chassis_physical_interface" "n315" {
  admin_state      = local.m_315["admin_state"]
  auto_negotiation = local.m_315["auto_negotiation"]
  chassis_id       = local.m_315["chassis_id"]
  domain           = local.m_315["domain"]
  duplex           = local.m_315["duplex"]
  fec_mode         = local.m_315["fec_mode"]
  name             = local.m_315["name"]
  port_type        = local.m_315["port_type"]
  speed            = local.m_315["speed"]
}
