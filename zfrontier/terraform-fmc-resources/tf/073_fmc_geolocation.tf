# 073 · resource fmc_geolocation · 2. Objects
# This resource manages a Geolocation.
# Reads models/fmc_geolocation.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_073 = yamldecode(file("${path.module}/../models/fmc_geolocation.yml"))["fmc_geolocation"]
}

resource "fmc_geolocation" "n073" {
  continents = local.m_073["continents"]
  countries = local.m_073["countries"]
  domain = local.m_073["domain"]
  name = local.m_073["name"]
}
