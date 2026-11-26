# 088 · resource aci_snmp_community · 1. System and fabric setup
# Manages ACI SNMP Community
# APIC class: not collected · DN: not collected
# Reads models/aci_snmp_community.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_088 = yamldecode(file("${path.module}/../models/aci_snmp_community.yml"))["aci_snmp_community"]
}

resource "aci_snmp_community" "n088" {
  annotation  = local.m_088["annotation"]
  description = local.m_088["description"]
  name        = local.m_088["name"]
  name_alias  = local.m_088["name_alias"]
  parent_dn   = local.m_088["parent_dn"]
}
