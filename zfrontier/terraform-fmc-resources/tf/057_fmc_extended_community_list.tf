# 057 · resource fmc_extended_community_list · 2. Objects
# This resource manages an Extended Community List.
# Reads models/fmc_extended_community_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_057 = yamldecode(file("${path.module}/../models/fmc_extended_community_list.yml"))["fmc_extended_community_list"]
}

resource "fmc_extended_community_list" "n057" {
  domain = local.m_057["domain"]
  entries = local.m_057["entries"]
  name = local.m_057["name"]
  sub_type = local.m_057["sub_type"]
}
