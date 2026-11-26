# 221 · data source fmc_sinkhole · 2. Objects
# This data source reads the Sinkhole.
# Reads models/data_fmc_sinkhole.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_221 = yamldecode(file("${path.module}/../models/data_fmc_sinkhole.yml"))["data_fmc_sinkhole"]
}

data "fmc_sinkhole" "n221" {
  domain = local.m_221["domain"]
  id = local.m_221["id"]
  name = local.m_221["name"]
}

output "n221_data_fmc_sinkhole_id" {
  value = data.fmc_sinkhole.n221.id
}
