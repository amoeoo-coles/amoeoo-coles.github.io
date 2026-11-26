# 214 · resource fmc_sgt · 2. Objects
# This resource manages SGT (Security Group Tag) Object. The following restrictions apply: Read operations are supported by any tested FMC versionMinimum FMC version for object management (Create/Update/Delete): 7.4
# Reads models/fmc_sgt.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_214 = yamldecode(file("${path.module}/../models/fmc_sgt.yml"))["fmc_sgt"]
}

resource "fmc_sgt" "n214" {
  description = local.m_214["description"]
  domain      = local.m_214["domain"]
  name        = local.m_214["name"]
  tag         = local.m_214["tag"]
}
