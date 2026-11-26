# 174 · resource fmc_resource_profile · 2. Objects
# This resource manages a Resource Profile. The following restrictions apply: Read operations are supported by any tested FMC versionMinimum FMC version for object management (Create/Update/Delete): 7.4
# Reads models/fmc_resource_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_174 = yamldecode(file("${path.module}/../models/fmc_resource_profile.yml"))["fmc_resource_profile"]
}

resource "fmc_resource_profile" "n174" {
  description    = local.m_174["description"]
  domain         = local.m_174["domain"]
  name           = local.m_174["name"]
  number_of_cpus = local.m_174["number_of_cpus"]
}
