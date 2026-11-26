# 135 · data source fmc_key_chain · 2. Objects
# This data source reads the Key Chain.
# Reads models/data_fmc_key_chain.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_135 = yamldecode(file("${path.module}/../models/data_fmc_key_chain.yml"))["data_fmc_key_chain"]
}

data "fmc_key_chain" "n135" {
  domain = local.m_135["domain"]
  id = local.m_135["id"]
  name = local.m_135["name"]
}

output "n135_data_fmc_key_chain_id" {
  value = data.fmc_key_chain.n135.id
}
