# 312 · data source fmc_chassis_etherchannel_interface · 4. Devices
# This data source reads the Chassis EtherChannel Interface.
# Reads models/data_fmc_chassis_etherchannel_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_312 = yamldecode(file("${path.module}/../models/data_fmc_chassis_etherchannel_interface.yml"))["data_fmc_chassis_etherchannel_interface"]
}

data "fmc_chassis_etherchannel_interface" "n312" {
  chassis_id = local.m_312["chassis_id"]
  domain     = local.m_312["domain"]
  id         = local.m_312["id"]
  name       = local.m_312["name"]
}

output "n312_data_fmc_chassis_etherchannel_interface_id" {
  value = data.fmc_chassis_etherchannel_interface.n312.id
}
