# 310 · data source fmc_chassis · 4. Devices
# This data source reads the Chassis.
# Reads models/data_fmc_chassis.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_310 = yamldecode(file("${path.module}/../models/data_fmc_chassis.yml"))["data_fmc_chassis"]
}

data "fmc_chassis" "n310" {
  domain = local.m_310["domain"]
  id     = local.m_310["id"]
  name   = local.m_310["name"]
}

output "n310_data_fmc_chassis_id" {
  value = data.fmc_chassis.n310.id
}
