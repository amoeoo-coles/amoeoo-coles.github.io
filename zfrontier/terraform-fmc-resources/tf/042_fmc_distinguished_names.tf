# 042 · resource fmc_distinguished_names · 2. Objects
# This resource manages Distinguished Names through bulk operations. The following restrictions apply: Minimum FMC version: 7.4Bulk object creation is not supported by FMC, it will be handled one-by-oneBulk object deletion is not supported by FMC, it will be handled one-by-oneUpdates are always done
# Reads models/fmc_distinguished_names.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_042 = yamldecode(file("${path.module}/../models/fmc_distinguished_names.yml"))["fmc_distinguished_names"]
}

resource "fmc_distinguished_names" "n042" {
  domain = local.m_042["domain"]
  items  = local.m_042["items"]
}
