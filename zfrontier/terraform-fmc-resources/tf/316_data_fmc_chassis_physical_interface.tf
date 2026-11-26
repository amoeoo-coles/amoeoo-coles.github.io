# 316 · data source fmc_chassis_physical_interface · 4. Devices
# This data source reads the Chassis Physical Interface.
# Reads models/data_fmc_chassis_physical_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_316 = yamldecode(file("${path.module}/../models/data_fmc_chassis_physical_interface.yml"))["data_fmc_chassis_physical_interface"]
}

data "fmc_chassis_physical_interface" "n316" {
  chassis_id = local.m_316["chassis_id"]
  domain = local.m_316["domain"]
  id = local.m_316["id"]
  name = local.m_316["name"]
}

output "n316_data_fmc_chassis_physical_interface_id" {
  value = data.fmc_chassis_physical_interface.n316.id
}
