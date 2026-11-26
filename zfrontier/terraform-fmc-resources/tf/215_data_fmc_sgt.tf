# 215 · data source fmc_sgt · 2. Objects
# This data source reads the SGT (Security Group Tag) Object.
# Reads models/data_fmc_sgt.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_215 = yamldecode(file("${path.module}/../models/data_fmc_sgt.yml"))["data_fmc_sgt"]
}

data "fmc_sgt" "n215" {
  domain = local.m_215["domain"]
  id = local.m_215["id"]
  name = local.m_215["name"]
}

output "n215_data_fmc_sgt_id" {
  value = data.fmc_sgt.n215.id
}
