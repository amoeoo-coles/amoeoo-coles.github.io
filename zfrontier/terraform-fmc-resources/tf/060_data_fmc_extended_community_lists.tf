# 060 · data source fmc_extended_community_lists · 2. Objects
# This data source reads the Extended Community Lists.
# Reads models/data_fmc_extended_community_lists.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_060 = yamldecode(file("${path.module}/../models/data_fmc_extended_community_lists.yml"))["data_fmc_extended_community_lists"]
}

data "fmc_extended_community_lists" "n060" {
  domain = local.m_060["domain"]
  items = local.m_060["items"]
}

output "n060_data_fmc_extended_community_lists_id" {
  value = data.fmc_extended_community_lists.n060.id
}
