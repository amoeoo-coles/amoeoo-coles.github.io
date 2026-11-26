# 034 · resource fmc_cipher_suite_list · 2. Objects
# This resource manages a Cipher Suite List. The following restrictions apply: Minimum FMC version: 7.4
# Reads models/fmc_cipher_suite_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_034 = yamldecode(file("${path.module}/../models/fmc_cipher_suite_list.yml"))["fmc_cipher_suite_list"]
}

resource "fmc_cipher_suite_list" "n034" {
  cipher_suites = local.m_034["cipher_suites"]
  domain        = local.m_034["domain"]
  name          = local.m_034["name"]
}
