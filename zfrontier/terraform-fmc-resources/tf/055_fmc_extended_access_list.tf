# 055 · resource fmc_extended_access_list · 2. Objects
# This resource manages an Extended Access List. The following restrictions apply: Read operations are supported by any tested FMC versionMinimum FMC version for object management (Create/Update/Delete): 7.2
# Reads models/fmc_extended_access_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_055 = yamldecode(file("${path.module}/../models/fmc_extended_access_list.yml"))["fmc_extended_access_list"]
}

resource "fmc_extended_access_list" "n055" {
  domain  = local.m_055["domain"]
  entries = local.m_055["entries"]
  name    = local.m_055["name"]
}
