# 177 · data source fmc_resource_profiles · 2. Objects
# This data source reads the Resource Profiles.
# Reads models/data_fmc_resource_profiles.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_177 = yamldecode(file("${path.module}/../models/data_fmc_resource_profiles.yml"))["data_fmc_resource_profiles"]
}

data "fmc_resource_profiles" "n177" {
  domain = local.m_177["domain"]
  items = local.m_177["items"]
}

output "n177_data_fmc_resource_profiles_id" {
  value = data.fmc_resource_profiles.n177.id
}
