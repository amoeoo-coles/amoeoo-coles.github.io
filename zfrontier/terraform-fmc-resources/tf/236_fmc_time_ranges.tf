# 236 · resource fmc_time_ranges · 2. Objects
# This resource manages Time Ranges through bulk operations. The following restrictions apply: Bulk object deletion is not supported by FMC, it will be handled one-by-oneUpdates are always done one-by-one.
# Reads models/fmc_time_ranges.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_236 = yamldecode(file("${path.module}/../models/fmc_time_ranges.yml"))["fmc_time_ranges"]
}

resource "fmc_time_ranges" "n236" {
  domain = local.m_236["domain"]
  items = local.m_236["items"]
}
