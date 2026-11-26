# 082 · data source fmc_host_overrides · 2. Objects
# This data source reads the Host Overrides.
# Reads models/data_fmc_host_overrides.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_082 = yamldecode(file("${path.module}/../models/data_fmc_host_overrides.yml"))["data_fmc_host_overrides"]
}

data "fmc_host_overrides" "n082" {
  domain = local.m_082["domain"]
  id = local.m_082["id"]
  parent_name = local.m_082["parent_name"]
}

output "n082_data_fmc_host_overrides_id" {
  value = data.fmc_host_overrides.n082.id
}
