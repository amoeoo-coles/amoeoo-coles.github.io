# 023 · data source fmc_as_paths · 2. Objects
# This data source reads the AS Paths.
# Reads models/data_fmc_as_paths.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_023 = yamldecode(file("${path.module}/../models/data_fmc_as_paths.yml"))["data_fmc_as_paths"]
}

data "fmc_as_paths" "n023" {
  domain = local.m_023["domain"]
  items = local.m_023["items"]
}

output "n023_data_fmc_as_paths_id" {
  value = data.fmc_as_paths.n023.id
}
