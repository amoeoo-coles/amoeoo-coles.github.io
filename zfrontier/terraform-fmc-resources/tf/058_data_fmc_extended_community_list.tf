# 058 · data source fmc_extended_community_list · 2. Objects
# This data source reads the Extended Community List.
# Reads models/data_fmc_extended_community_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_058 = yamldecode(file("${path.module}/../models/data_fmc_extended_community_list.yml"))["data_fmc_extended_community_list"]
}

data "fmc_extended_community_list" "n058" {
  domain = local.m_058["domain"]
  id     = local.m_058["id"]
  name   = local.m_058["name"]
}

output "n058_data_fmc_extended_community_list_id" {
  value = data.fmc_extended_community_list.n058.id
}
