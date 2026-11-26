# 022 · resource fmc_as_paths · 2. Objects
# This resource manages AS Paths through bulk operations. The following restrictions apply: Bulk object creation is not supported by FMC, it will be handled one-by-oneBulk object deletion is not supported by FMC, it will be handled one-by-oneUpdates are always done one-by-one.
# Reads models/fmc_as_paths.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_022 = yamldecode(file("${path.module}/../models/fmc_as_paths.yml"))["fmc_as_paths"]
}

resource "fmc_as_paths" "n022" {
  domain = local.m_022["domain"]
  items  = local.m_022["items"]
}
