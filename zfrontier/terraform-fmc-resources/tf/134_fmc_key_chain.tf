# 134 · resource fmc_key_chain · 2. Objects
# This resource manages a Key Chain.
# Reads models/fmc_key_chain.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_134 = yamldecode(file("${path.module}/../models/fmc_key_chain.yml"))["fmc_key_chain"]
}

resource "fmc_key_chain" "n134" {
  description = local.m_134["description"]
  domain = local.m_134["domain"]
  keys = local.m_134["keys"]
  name = local.m_134["name"]
}
