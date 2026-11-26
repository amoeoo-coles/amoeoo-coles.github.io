# 175 · data source fmc_resource_profile · 2. Objects
# This data source reads the Resource Profile.
# Reads models/data_fmc_resource_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_175 = yamldecode(file("${path.module}/../models/data_fmc_resource_profile.yml"))["data_fmc_resource_profile"]
}

data "fmc_resource_profile" "n175" {
  domain = local.m_175["domain"]
  id = local.m_175["id"]
  name = local.m_175["name"]
}

output "n175_data_fmc_resource_profile_id" {
  value = data.fmc_resource_profile.n175.id
}
