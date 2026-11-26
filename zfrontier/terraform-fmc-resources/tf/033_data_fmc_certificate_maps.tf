# 033 · data source fmc_certificate_maps · 2. Objects
# This data source reads the Certificate Maps.
# Reads models/data_fmc_certificate_maps.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_033 = yamldecode(file("${path.module}/../models/data_fmc_certificate_maps.yml"))["data_fmc_certificate_maps"]
}

data "fmc_certificate_maps" "n033" {
  domain = local.m_033["domain"]
  items  = local.m_033["items"]
}

output "n033_data_fmc_certificate_maps_id" {
  value = data.fmc_certificate_maps.n033.id
}
