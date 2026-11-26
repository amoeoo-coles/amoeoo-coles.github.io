# 146 · resource fmc_network_group_overrides · 2. Objects
# This resource manages a Network Group Overrides.
# Reads models/fmc_network_group_overrides.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_146 = yamldecode(file("${path.module}/../models/fmc_network_group_overrides.yml"))["fmc_network_group_overrides"]
}

resource "fmc_network_group_overrides" "n146" {
  domain = local.m_146["domain"]
  overrides = local.m_146["overrides"]
  parent_id = local.m_146["parent_id"]
  parent_name = local.m_146["parent_name"]
}
