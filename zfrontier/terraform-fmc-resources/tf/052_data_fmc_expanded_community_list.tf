# 052 · data source fmc_expanded_community_list · 2. Objects
# This data source reads the Expanded Community List.
# Reads models/data_fmc_expanded_community_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_052 = yamldecode(file("${path.module}/../models/data_fmc_expanded_community_list.yml"))["data_fmc_expanded_community_list"]
}

data "fmc_expanded_community_list" "n052" {
  domain = local.m_052["domain"]
  id     = local.m_052["id"]
  name   = local.m_052["name"]
}

output "n052_data_fmc_expanded_community_list_id" {
  value = data.fmc_expanded_community_list.n052.id
}
