# 021 · data source fmc_as_path · 2. Objects
# This data source reads the AS Path.
# Reads models/data_fmc_as_path.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_021 = yamldecode(file("${path.module}/../models/data_fmc_as_path.yml"))["data_fmc_as_path"]
}

data "fmc_as_path" "n021" {
  domain = local.m_021["domain"]
  id = local.m_021["id"]
  name = local.m_021["name"]
}

output "n021_data_fmc_as_path_id" {
  value = data.fmc_as_path.n021.id
}
