# 089 · resource fmc_icmpv6 · 2. Objects
# This resource manages an ICMPv6.
# Reads models/fmc_icmpv6.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_089 = yamldecode(file("${path.module}/../models/fmc_icmpv6.yml"))["fmc_icmpv6"]
}

resource "fmc_icmpv6" "n089" {
  code = local.m_089["code"]
  description = local.m_089["description"]
  domain = local.m_089["domain"]
  icmp_type = local.m_089["icmp_type"]
  name = local.m_089["name"]
  overridable = local.m_089["overridable"]
}
