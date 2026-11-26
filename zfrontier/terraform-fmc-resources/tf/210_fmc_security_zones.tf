# 210 · resource fmc_security_zones · 2. Objects
# This resource manages Security Zones through bulk operations. The following restrictions apply: Bulk object deletion is not supported by FMC, it will be handled one-by-oneUpdates are always done one-by-one.
# Reads models/fmc_security_zones.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_210 = yamldecode(file("${path.module}/../models/fmc_security_zones.yml"))["fmc_security_zones"]
}

resource "fmc_security_zones" "n210" {
  domain = local.m_210["domain"]
  items  = local.m_210["items"]
}
