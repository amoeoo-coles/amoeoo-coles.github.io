# 084 · resource aci_l3_interface_policy · 1. System and fabric setup
# Manages ACI L3 Interface Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_l3_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_084 = yamldecode(file("${path.module}/../models/aci_l3_interface_policy.yml"))["aci_l3_interface_policy"]
}

resource "aci_l3_interface_policy" "n084" {
  annotation  = local.m_084["annotation"]
  bfd_isis    = local.m_084["bfd_isis"]
  description = local.m_084["description"]
  name        = local.m_084["name"]
  name_alias  = local.m_084["name_alias"]
}
