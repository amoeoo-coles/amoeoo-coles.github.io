# 231 · data source fmc_standard_community_list · 2. Objects
# This data source reads the Standard Community List.
# Reads models/data_fmc_standard_community_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_231 = yamldecode(file("${path.module}/../models/data_fmc_standard_community_list.yml"))["data_fmc_standard_community_list"]
}

data "fmc_standard_community_list" "n231" {
  domain = local.m_231["domain"]
  id     = local.m_231["id"]
  name   = local.m_231["name"]
}

output "n231_data_fmc_standard_community_list_id" {
  value = data.fmc_standard_community_list.n231.id
}
