# 026 · resource fmc_bfd_templates · 2. Objects
# This resource manages BFD Templates through bulk operations. The following restrictions apply: Minimum FMC version: 7.4Bulk object creation is not supported by FMC, it will be handled one-by-oneBulk object deletion is not supported by FMC, it will be handled one-by-oneUpdates are always done one-b
# Reads models/fmc_bfd_templates.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_026 = yamldecode(file("${path.module}/../models/fmc_bfd_templates.yml"))["fmc_bfd_templates"]
}

resource "fmc_bfd_templates" "n026" {
  domain = local.m_026["domain"]
  items  = local.m_026["items"]
}
