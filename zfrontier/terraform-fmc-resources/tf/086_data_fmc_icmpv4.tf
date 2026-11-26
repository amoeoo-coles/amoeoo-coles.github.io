# 086 · data source fmc_icmpv4 · 2. Objects
# This data source reads the ICMPv4.
# Reads models/data_fmc_icmpv4.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_086 = yamldecode(file("${path.module}/../models/data_fmc_icmpv4.yml"))["data_fmc_icmpv4"]
}

data "fmc_icmpv4" "n086" {
  domain = local.m_086["domain"]
  id     = local.m_086["id"]
  name   = local.m_086["name"]
}

output "n086_data_fmc_icmpv4_id" {
  value = data.fmc_icmpv4.n086.id
}
