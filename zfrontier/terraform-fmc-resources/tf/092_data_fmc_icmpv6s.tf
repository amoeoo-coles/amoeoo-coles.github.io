# 092 · data source fmc_icmpv6s · 2. Objects
# This data source reads the ICMPv6s.
# Reads models/data_fmc_icmpv6s.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_092 = yamldecode(file("${path.module}/../models/data_fmc_icmpv6s.yml"))["data_fmc_icmpv6s"]
}

data "fmc_icmpv6s" "n092" {
  domain = local.m_092["domain"]
  items = local.m_092["items"]
}

output "n092_data_fmc_icmpv6s_id" {
  value = data.fmc_icmpv6s.n092.id
}
