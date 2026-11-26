# 217 · data source fmc_sgts · 2. Objects
# This data source reads the SGT (Security Group Tag) Object through bulk operations.
# Reads models/data_fmc_sgts.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_217 = yamldecode(file("${path.module}/../models/data_fmc_sgts.yml"))["data_fmc_sgts"]
}

data "fmc_sgts" "n217" {
  domain = local.m_217["domain"]
  items  = local.m_217["items"]
}

output "n217_data_fmc_sgts_id" {
  value = data.fmc_sgts.n217.id
}
