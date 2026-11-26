# 265 · resource aci_vpc_explicit_protection_group · 2. Access policies
# Manages ACI VPC Explicit Protection Group
# APIC class: not collected · DN: not collected
# Reads models/aci_vpc_explicit_protection_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_265 = yamldecode(file("${path.module}/../models/aci_vpc_explicit_protection_group.yml"))["aci_vpc_explicit_protection_group"]
}

resource "aci_vpc_explicit_protection_group" "n265" {
  annotation                       = local.m_265["annotation"]
  name                             = local.m_265["name"]
  switch1                          = local.m_265["switch1"]
  switch2                          = local.m_265["switch2"]
  vpc_domain_policy                = local.m_265["vpc_domain_policy"]
  vpc_explicit_protection_group_id = local.m_265["vpc_explicit_protection_group_id"]
}
