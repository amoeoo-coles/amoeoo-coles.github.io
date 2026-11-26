# 232 · resource fmc_standard_community_lists · 2. Objects
# This resource manages Standard Community Lists through bulk operations. The following restrictions apply: Bulk object creation is not supported by FMC, it will be handled one-by-oneBulk object deletion is not supported by FMC, it will be handled one-by-oneUpdates are always done one-by-one.
# Reads models/fmc_standard_community_lists.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_232 = yamldecode(file("${path.module}/../models/fmc_standard_community_lists.yml"))["fmc_standard_community_lists"]
}

resource "fmc_standard_community_lists" "n232" {
  domain = local.m_232["domain"]
  items = local.m_232["items"]
}
