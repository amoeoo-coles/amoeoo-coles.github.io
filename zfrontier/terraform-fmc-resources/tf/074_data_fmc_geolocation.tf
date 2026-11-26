# 074 · data source fmc_geolocation · 2. Objects
# This data source reads the Geolocation.
# Reads models/data_fmc_geolocation.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_074 = yamldecode(file("${path.module}/../models/data_fmc_geolocation.yml"))["data_fmc_geolocation"]
}

data "fmc_geolocation" "n074" {
  domain = local.m_074["domain"]
  id     = local.m_074["id"]
  name   = local.m_074["name"]
}

output "n074_data_fmc_geolocation_id" {
  value = data.fmc_geolocation.n074.id
}
