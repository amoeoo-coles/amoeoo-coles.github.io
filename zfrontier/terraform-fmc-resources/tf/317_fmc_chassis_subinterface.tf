# 317 · resource fmc_chassis_subinterface · 4. Devices
# This resource manages a Chassis Subinterface.
# Reads models/fmc_chassis_subinterface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_317 = yamldecode(file("${path.module}/../models/fmc_chassis_subinterface.yml"))["fmc_chassis_subinterface"]
}

resource "fmc_chassis_subinterface" "n317" {
  chassis_id       = local.m_317["chassis_id"]
  domain           = local.m_317["domain"]
  interface_id     = local.m_317["interface_id"]
  interface_name   = local.m_317["interface_name"]
  port_type        = local.m_317["port_type"]
  sub_interface_id = local.m_317["sub_interface_id"]
  vlan_id          = local.m_317["vlan_id"]
}
