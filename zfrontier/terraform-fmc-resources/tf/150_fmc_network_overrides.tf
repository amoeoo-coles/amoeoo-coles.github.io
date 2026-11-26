# 150 · resource fmc_network_overrides · 2. Objects
# This resource manages a Network Overrides.
# Reads models/fmc_network_overrides.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_150 = yamldecode(file("${path.module}/../models/fmc_network_overrides.yml"))["fmc_network_overrides"]
}

resource "fmc_network_overrides" "n150" {
  domain      = local.m_150["domain"]
  overrides   = local.m_150["overrides"]
  parent_id   = local.m_150["parent_id"]
  parent_name = local.m_150["parent_name"]
}
