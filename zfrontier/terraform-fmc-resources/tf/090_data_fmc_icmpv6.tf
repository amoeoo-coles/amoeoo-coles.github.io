# 090 · data source fmc_icmpv6 · 2. Objects
# This data source reads the ICMPv6.
# Reads models/data_fmc_icmpv6.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_090 = yamldecode(file("${path.module}/../models/data_fmc_icmpv6.yml"))["data_fmc_icmpv6"]
}

data "fmc_icmpv6" "n090" {
  domain = local.m_090["domain"]
  id     = local.m_090["id"]
  name   = local.m_090["name"]
}

output "n090_data_fmc_icmpv6_id" {
  value = data.fmc_icmpv6.n090.id
}
