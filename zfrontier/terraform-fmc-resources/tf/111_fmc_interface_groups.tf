# 111 · resource fmc_interface_groups · 2. Objects
# This resource manages Interface Groups through bulk operations. The following restrictions apply: Bulk object deletion is not supported by FMC, it will be handled one-by-oneUpdates are always done one-by-one.
# Reads models/fmc_interface_groups.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_111 = yamldecode(file("${path.module}/../models/fmc_interface_groups.yml"))["fmc_interface_groups"]
}

resource "fmc_interface_groups" "n111" {
  domain = local.m_111["domain"]
  items  = local.m_111["items"]
}
