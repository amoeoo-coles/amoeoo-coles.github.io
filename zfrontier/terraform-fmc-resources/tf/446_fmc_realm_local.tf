# 446 · resource fmc_realm_local · 6. Integrations
# This resource manages a Realm Local.
# Reads models/fmc_realm_local.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_446 = yamldecode(file("${path.module}/../models/fmc_realm_local.yml"))["fmc_realm_local"]
}

resource "fmc_realm_local" "n446" {
  description = local.m_446["description"]
  domain      = local.m_446["domain"]
  name        = local.m_446["name"]
}
