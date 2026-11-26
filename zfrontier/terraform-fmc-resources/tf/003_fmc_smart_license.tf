# 003 · resource fmc_smart_license · 1. System information and licences
# This resource manages a Smart License.
# Reads models/fmc_smart_license.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_003 = yamldecode(file("${path.module}/../models/fmc_smart_license.yml"))["fmc_smart_license"]
}

resource "fmc_smart_license" "n003" {
  force               = local.m_003["force"]
  registration_type   = local.m_003["registration_type"]
  retain_registration = local.m_003["retain_registration"]
  token               = try(var.secrets["fmc_smart_license.token"], local.m_003["token"])
}
