# 032 · resource fmc_certificate_maps · 2. Objects
# This resource manages Certificate Maps through bulk operations. The following restrictions apply: Bulk object creation is not supported by FMC, it will be handled one-by-oneBulk object deletion is not supported by FMC, it will be handled one-by-oneUpdates are always done one-by-one.
# Reads models/fmc_certificate_maps.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_032 = yamldecode(file("${path.module}/../models/fmc_certificate_maps.yml"))["fmc_certificate_maps"]
}

resource "fmc_certificate_maps" "n032" {
  domain = local.m_032["domain"]
  items = local.m_032["items"]
}
