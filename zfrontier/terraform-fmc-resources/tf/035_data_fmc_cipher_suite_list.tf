# 035 · data source fmc_cipher_suite_list · 2. Objects
# This data source reads the Cipher Suite List. The following restrictions apply: Minimum FMC version: 7.4
# Reads models/data_fmc_cipher_suite_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_035 = yamldecode(file("${path.module}/../models/data_fmc_cipher_suite_list.yml"))["data_fmc_cipher_suite_list"]
}

data "fmc_cipher_suite_list" "n035" {
  domain = local.m_035["domain"]
  id     = local.m_035["id"]
  name   = local.m_035["name"]
}

output "n035_data_fmc_cipher_suite_list_id" {
  value = data.fmc_cipher_suite_list.n035.id
}
