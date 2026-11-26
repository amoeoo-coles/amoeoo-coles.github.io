# 019 · resource aci_aaa_domain_relationship · 1. System and fabric setup
# Manages ACI AAA Domain Relationship for Parent Object
# APIC class: not collected · DN: not collected
# Reads models/aci_aaa_domain_relationship.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_019 = yamldecode(file("${path.module}/../models/aci_aaa_domain_relationship.yml"))["aci_aaa_domain_relationship"]
}

resource "aci_aaa_domain_relationship" "n019" {
  aaa_domain_dn = local.m_019["aaa_domain_dn"]
  annotation    = local.m_019["annotation"]
  description   = local.m_019["description"]
  name_alias    = local.m_019["name_alias"]
  parent_dn     = local.m_019["parent_dn"]
}
