# 261 · resource fmc_vlan_tags · 2. Objects
# This resource manages VLAN Tags through bulk operations. The following restrictions apply: Minimum FMC version for bulk object deletion: 7.4If FMC version does not meet the minimum version requirement for bulk operations, this resource will automatically fall back to processing operations one-by-o
# Reads models/fmc_vlan_tags.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_261 = yamldecode(file("${path.module}/../models/fmc_vlan_tags.yml"))["fmc_vlan_tags"]
}

resource "fmc_vlan_tags" "n261" {
  domain = local.m_261["domain"]
  items = local.m_261["items"]
}
