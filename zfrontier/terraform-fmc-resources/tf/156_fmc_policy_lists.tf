# 156 · resource fmc_policy_lists · 2. Objects
# This resource manages Policy Lists through bulk operations. The following restrictions apply: Bulk object creation is not supported by FMC, it will be handled one-by-oneBulk object deletion is not supported by FMC, it will be handled one-by-oneUpdates are always done one-by-one.
# Reads models/fmc_policy_lists.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_156 = yamldecode(file("${path.module}/../models/fmc_policy_lists.yml"))["fmc_policy_lists"]
}

resource "fmc_policy_lists" "n156" {
  domain = local.m_156["domain"]
  items  = local.m_156["items"]
}
