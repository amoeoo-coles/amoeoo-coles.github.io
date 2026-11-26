# 691 · resource aci_tag · 8. Operational and utility
# Manages ACI Tag
# APIC class: tagTag · DN: not collected
# Reads models/aci_tag.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_691 = yamldecode(file("${path.module}/../models/aci_tag.yml"))["aci_tag"]
}

resource "aci_tag" "n691" {
  key       = local.m_691["key"]
  parent_dn = local.m_691["parent_dn"]
  value     = local.m_691["value"]
}
