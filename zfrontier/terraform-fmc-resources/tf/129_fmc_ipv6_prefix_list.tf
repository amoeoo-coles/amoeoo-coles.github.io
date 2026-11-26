# 129 · resource fmc_ipv6_prefix_list · 2. Objects
# This resource manages an IPv6 Prefix List.
# Reads models/fmc_ipv6_prefix_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_129 = yamldecode(file("${path.module}/../models/fmc_ipv6_prefix_list.yml"))["fmc_ipv6_prefix_list"]
}

resource "fmc_ipv6_prefix_list" "n129" {
  domain  = local.m_129["domain"]
  entries = local.m_129["entries"]
  name    = local.m_129["name"]
}
