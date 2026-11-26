# 036 · resource fmc_cipher_suite_lists · 2. Objects
# This resource manages Cipher Suite Lists through bulk operations. The following restrictions apply: Minimum FMC version: 7.4Bulk object creation is not supported by FMC, it will be handled one-by-oneBulk object deletion is not supported by FMC, it will be handled one-by-oneUpdates are always done 
# Reads models/fmc_cipher_suite_lists.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_036 = yamldecode(file("${path.module}/../models/fmc_cipher_suite_lists.yml"))["fmc_cipher_suite_lists"]
}

resource "fmc_cipher_suite_lists" "n036" {
  domain = local.m_036["domain"]
  items = local.m_036["items"]
}
