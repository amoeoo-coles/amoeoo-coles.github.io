# 318 · data source fmc_chassis_subinterface · 4. Devices
# This data source reads the Chassis Subinterface.
# Reads models/data_fmc_chassis_subinterface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_318 = yamldecode(file("${path.module}/../models/data_fmc_chassis_subinterface.yml"))["data_fmc_chassis_subinterface"]
}

data "fmc_chassis_subinterface" "n318" {
  chassis_id = local.m_318["chassis_id"]
  domain     = local.m_318["domain"]
  id         = local.m_318["id"]
  name       = local.m_318["name"]
}

output "n318_data_fmc_chassis_subinterface_id" {
  value = data.fmc_chassis_subinterface.n318.id
}
