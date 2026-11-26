# 355 · data source fmc_device_inline_set · 4. Devices
# This data source reads the Device Inline Set.
# Reads models/data_fmc_device_inline_set.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_355 = yamldecode(file("${path.module}/../models/data_fmc_device_inline_set.yml"))["data_fmc_device_inline_set"]
}

data "fmc_device_inline_set" "n355" {
  device_id = local.m_355["device_id"]
  domain = local.m_355["domain"]
  id = local.m_355["id"]
  name = local.m_355["name"]
}

output "n355_data_fmc_device_inline_set_id" {
  value = data.fmc_device_inline_set.n355.id
}
