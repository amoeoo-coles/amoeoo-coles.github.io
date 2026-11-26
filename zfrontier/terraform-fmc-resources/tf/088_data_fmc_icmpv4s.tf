# 088 · data source fmc_icmpv4s · 2. Objects
# This data source reads the ICMPv4s.
# Reads models/data_fmc_icmpv4s.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_088 = yamldecode(file("${path.module}/../models/data_fmc_icmpv4s.yml"))["data_fmc_icmpv4s"]
}

data "fmc_icmpv4s" "n088" {
  domain = local.m_088["domain"]
  items  = local.m_088["items"]
}

output "n088_data_fmc_icmpv4s_id" {
  value = data.fmc_icmpv4s.n088.id
}
