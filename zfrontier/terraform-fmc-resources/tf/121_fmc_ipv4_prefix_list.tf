# 121 · resource fmc_ipv4_prefix_list · 2. Objects
# This resource manages an IPv4 Prefix List.
# Reads models/fmc_ipv4_prefix_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_121 = yamldecode(file("${path.module}/../models/fmc_ipv4_prefix_list.yml"))["fmc_ipv4_prefix_list"]
}

resource "fmc_ipv4_prefix_list" "n121" {
  domain = local.m_121["domain"]
  entries = local.m_121["entries"]
  name = local.m_121["name"]
}
