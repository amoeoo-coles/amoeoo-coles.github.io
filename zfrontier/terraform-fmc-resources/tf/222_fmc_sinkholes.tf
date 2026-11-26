# 222 · resource fmc_sinkholes · 2. Objects
# This resource manages Sinkholes through bulk operations. The following restrictions apply: Read operations are supported by any tested FMC versionMinimum FMC version for object management (Create/Update/Delete): 10.0Bulk object creation is not supported by FMC, it will be handled one-by-oneBulk ob
# Reads models/fmc_sinkholes.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_222 = yamldecode(file("${path.module}/../models/fmc_sinkholes.yml"))["fmc_sinkholes"]
}

resource "fmc_sinkholes" "n222" {
  domain = local.m_222["domain"]
  items  = local.m_222["items"]
}
