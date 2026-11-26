# 259 · resource fmc_vlan_tag_groups · 2. Objects
# This resource manages VLAN Tag Groups through bulk operations. The following restrictions apply: Minimum FMC version for bulk object deletion: 7.4If FMC version does not meet the minimum version requirement for bulk operations, this resource will automatically fall back to processing operations on
# Reads models/fmc_vlan_tag_groups.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_259 = yamldecode(file("${path.module}/../models/fmc_vlan_tag_groups.yml"))["fmc_vlan_tag_groups"]
}

resource "fmc_vlan_tag_groups" "n259" {
  domain = local.m_259["domain"]
  items = local.m_259["items"]
}
