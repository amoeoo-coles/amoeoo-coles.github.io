# 011 · resource fmc_application_filters · 2. Objects
# This resource manages Application Filters through bulk operations. The following restrictions apply: Bulk object creation is not supported by FMC, it will be handled one-by-oneBulk object deletion is not supported by FMC, it will be handled one-by-oneUpdates are always done one-by-one.
# Reads models/fmc_application_filters.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_011 = yamldecode(file("${path.module}/../models/fmc_application_filters.yml"))["fmc_application_filters"]
}

resource "fmc_application_filters" "n011" {
  domain = local.m_011["domain"]
  items = local.m_011["items"]
}
