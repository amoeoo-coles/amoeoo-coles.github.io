# 137 · data source fmc_key_chains · 2. Objects
# This data source reads the Key Chains.
# Reads models/data_fmc_key_chains.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_137 = yamldecode(file("${path.module}/../models/data_fmc_key_chains.yml"))["data_fmc_key_chains"]
}

data "fmc_key_chains" "n137" {
  domain = local.m_137["domain"]
  items  = local.m_137["items"]
}

output "n137_data_fmc_key_chains_id" {
  value = data.fmc_key_chains.n137.id
}
