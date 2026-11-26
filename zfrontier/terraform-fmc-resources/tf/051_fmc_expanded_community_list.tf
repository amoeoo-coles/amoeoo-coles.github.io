# 051 · resource fmc_expanded_community_list · 2. Objects
# This resource manages an Expanded Community List.
# Reads models/fmc_expanded_community_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_051 = yamldecode(file("${path.module}/../models/fmc_expanded_community_list.yml"))["fmc_expanded_community_list"]
}

resource "fmc_expanded_community_list" "n051" {
  domain = local.m_051["domain"]
  entries = local.m_051["entries"]
  name = local.m_051["name"]
}
