# 050 · data source fmc_endpoint_device_types · 2. Objects
# This data source reads the Endpoint Device Types.
# Reads models/data_fmc_endpoint_device_types.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_050 = yamldecode(file("${path.module}/../models/data_fmc_endpoint_device_types.yml"))["data_fmc_endpoint_device_types"]
}

data "fmc_endpoint_device_types" "n050" {
  domain = local.m_050["domain"]
  items  = local.m_050["items"]
}

output "n050_data_fmc_endpoint_device_types_id" {
  value = data.fmc_endpoint_device_types.n050.id
}
