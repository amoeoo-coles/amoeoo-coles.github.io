# 168 · resource fmc_range · 2. Objects
# This resource manages a Range.
# Reads models/fmc_range.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_168 = yamldecode(file("${path.module}/../models/fmc_range.yml"))["fmc_range"]
}

resource "fmc_range" "n168" {
  description = local.m_168["description"]
  domain      = local.m_168["domain"]
  ip_range    = local.m_168["ip_range"]
  name        = local.m_168["name"]
  overridable = local.m_168["overridable"]
}
