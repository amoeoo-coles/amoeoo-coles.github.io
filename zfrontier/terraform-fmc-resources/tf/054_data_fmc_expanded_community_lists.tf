# 054 · data source fmc_expanded_community_lists · 2. Objects
# This data source reads the Expanded Community Lists.
# Reads models/data_fmc_expanded_community_lists.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_054 = yamldecode(file("${path.module}/../models/data_fmc_expanded_community_lists.yml"))["data_fmc_expanded_community_lists"]
}

data "fmc_expanded_community_lists" "n054" {
  domain = local.m_054["domain"]
  items  = local.m_054["items"]
}

output "n054_data_fmc_expanded_community_lists_id" {
  value = data.fmc_expanded_community_lists.n054.id
}
