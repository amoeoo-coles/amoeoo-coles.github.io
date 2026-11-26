# 176 · resource fmc_resource_profiles · 2. Objects
# This resource manages Resource Profiles through bulk operations. The following restrictions apply: Read operations are supported by any tested FMC versionMinimum FMC version for object management (Create/Update/Delete): 7.4Bulk object creation is not supported by FMC, it will be handled one-by-one
# Reads models/fmc_resource_profiles.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_176 = yamldecode(file("${path.module}/../models/fmc_resource_profiles.yml"))["fmc_resource_profiles"]
}

resource "fmc_resource_profiles" "n176" {
  domain = local.m_176["domain"]
  items = local.m_176["items"]
}
