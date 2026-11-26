# 037 · data source fmc_cipher_suite_lists · 2. Objects
# This data source reads the Cipher Suite Lists. The following restrictions apply: Minimum FMC version: 7.4
# Reads models/data_fmc_cipher_suite_lists.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_037 = yamldecode(file("${path.module}/../models/data_fmc_cipher_suite_lists.yml"))["data_fmc_cipher_suite_lists"]
}

data "fmc_cipher_suite_lists" "n037" {
  domain = local.m_037["domain"]
  items = local.m_037["items"]
}

output "n037_data_fmc_cipher_suite_lists_id" {
  value = data.fmc_cipher_suite_lists.n037.id
}
