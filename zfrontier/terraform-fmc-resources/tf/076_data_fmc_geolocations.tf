# 076 · data source fmc_geolocations · 2. Objects
# This data source reads the Geolocations.
# Reads models/data_fmc_geolocations.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_076 = yamldecode(file("${path.module}/../models/data_fmc_geolocations.yml"))["data_fmc_geolocations"]
}

data "fmc_geolocations" "n076" {
  domain = local.m_076["domain"]
  items = local.m_076["items"]
}

output "n076_data_fmc_geolocations_id" {
  value = data.fmc_geolocations.n076.id
}
