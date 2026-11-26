# 233 · data source fmc_standard_community_lists · 2. Objects
# This data source reads the Standard Community Lists.
# Reads models/data_fmc_standard_community_lists.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_233 = yamldecode(file("${path.module}/../models/data_fmc_standard_community_lists.yml"))["data_fmc_standard_community_lists"]
}

data "fmc_standard_community_lists" "n233" {
  domain = local.m_233["domain"]
  items = local.m_233["items"]
}

output "n233_data_fmc_standard_community_lists_id" {
  value = data.fmc_standard_community_lists.n233.id
}
