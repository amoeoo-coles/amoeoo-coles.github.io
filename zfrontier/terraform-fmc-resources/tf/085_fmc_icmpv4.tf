# 085 · resource fmc_icmpv4 · 2. Objects
# This resource manages an ICMPv4.
# Reads models/fmc_icmpv4.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_085 = yamldecode(file("${path.module}/../models/fmc_icmpv4.yml"))["fmc_icmpv4"]
}

resource "fmc_icmpv4" "n085" {
  code = local.m_085["code"]
  description = local.m_085["description"]
  domain = local.m_085["domain"]
  icmp_type = local.m_085["icmp_type"]
  name = local.m_085["name"]
  overridable = local.m_085["overridable"]
}
