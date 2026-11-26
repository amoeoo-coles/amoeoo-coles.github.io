# 069 · resource fmc_fqdn_overrides · 2. Objects
# This resource manages a FQDN Overrides.
# Reads models/fmc_fqdn_overrides.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_069 = yamldecode(file("${path.module}/../models/fmc_fqdn_overrides.yml"))["fmc_fqdn_overrides"]
}

resource "fmc_fqdn_overrides" "n069" {
  domain = local.m_069["domain"]
  overrides = local.m_069["overrides"]
  parent_id = local.m_069["parent_id"]
  parent_name = local.m_069["parent_name"]
}
