# 381 · data source fmc_device_vtep_policy · 4. Devices
# This data source reads the Device VTEP Policy.
# Reads models/data_fmc_device_vtep_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_381 = yamldecode(file("${path.module}/../models/data_fmc_device_vtep_policy.yml"))["data_fmc_device_vtep_policy"]
}

data "fmc_device_vtep_policy" "n381" {
  device_id = local.m_381["device_id"]
  domain    = local.m_381["domain"]
  id        = local.m_381["id"]
}

output "n381_data_fmc_device_vtep_policy_id" {
  value = data.fmc_device_vtep_policy.n381.id
}
