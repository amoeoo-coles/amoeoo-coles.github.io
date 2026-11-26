# 216 · resource fmc_sgts · 2. Objects
# This resource manages SGT (Security Group Tag) Object through bulk operations. The following restrictions apply: Read operations are supported by any tested FMC versionMinimum FMC version for object management (Create/Update/Delete): 7.4Bulk object creation is not supported by FMC, it will be hand
# Reads models/fmc_sgts.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_216 = yamldecode(file("${path.module}/../models/fmc_sgts.yml"))["fmc_sgts"]
}

resource "fmc_sgts" "n216" {
  domain = local.m_216["domain"]
  items  = local.m_216["items"]
}
