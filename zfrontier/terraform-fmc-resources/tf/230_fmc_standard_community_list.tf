# 230 · resource fmc_standard_community_list · 2. Objects
# This resource manages a Standard Community List.
# Reads models/fmc_standard_community_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_230 = yamldecode(file("${path.module}/../models/fmc_standard_community_list.yml"))["fmc_standard_community_list"]
}

resource "fmc_standard_community_list" "n230" {
  domain  = local.m_230["domain"]
  entries = local.m_230["entries"]
  name    = local.m_230["name"]
}
