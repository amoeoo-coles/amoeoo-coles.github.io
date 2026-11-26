# 136 · resource fmc_key_chains · 2. Objects
# This resource manages Key Chains through bulk operations. The following restrictions apply: Bulk object deletion is not supported by FMC, it will be handled one-by-oneUpdates are always done one-by-one.
# Reads models/fmc_key_chains.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_136 = yamldecode(file("${path.module}/../models/fmc_key_chains.yml"))["fmc_key_chains"]
}

resource "fmc_key_chains" "n136" {
  domain = local.m_136["domain"]
  items = local.m_136["items"]
}
