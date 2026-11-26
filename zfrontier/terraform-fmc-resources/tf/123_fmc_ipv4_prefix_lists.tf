# 123 · resource fmc_ipv4_prefix_lists · 2. Objects
# This resource manages IPv4 Prefix Lists through bulk operations. The following restrictions apply: Bulk object creation is not supported by FMC, it will be handled one-by-oneBulk object deletion is not supported by FMC, it will be handled one-by-oneUpdates are always done one-by-one.
# Reads models/fmc_ipv4_prefix_lists.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_123 = yamldecode(file("${path.module}/../models/fmc_ipv4_prefix_lists.yml"))["fmc_ipv4_prefix_lists"]
}

resource "fmc_ipv4_prefix_lists" "n123" {
  domain = local.m_123["domain"]
  items  = local.m_123["items"]
}
