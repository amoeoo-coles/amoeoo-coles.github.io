# 075 · resource fmc_geolocations · 2. Objects
# This resource manages Geolocations through bulk operations. The following restrictions apply: Bulk object creation is not supported by FMC, it will be handled one-by-oneBulk object deletion is not supported by FMC, it will be handled one-by-oneUpdates are always done one-by-one.
# Reads models/fmc_geolocations.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_075 = yamldecode(file("${path.module}/../models/fmc_geolocations.yml"))["fmc_geolocations"]
}

resource "fmc_geolocations" "n075" {
  domain = local.m_075["domain"]
  items  = local.m_075["items"]
}
