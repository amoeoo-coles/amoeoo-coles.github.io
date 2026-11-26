# 228 · resource fmc_standard_access_list · 2. Objects
# This resource manages Standard Access List (Access Control List / ACP) Object. The following restrictions apply: Read operations are supported by any tested FMC versionMinimum FMC version for object management (Create/Update/Delete): 7.2
# Reads models/fmc_standard_access_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_228 = yamldecode(file("${path.module}/../models/fmc_standard_access_list.yml"))["fmc_standard_access_list"]
}

resource "fmc_standard_access_list" "n228" {
  description = local.m_228["description"]
  domain = local.m_228["domain"]
  entries = local.m_228["entries"]
  name = local.m_228["name"]
}
