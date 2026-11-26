# 432 · resource aci_vrf_snmp_context_community · 3. Tenant and networking
# Manages ACI SNMP Community
# APIC class: not collected · DN: not collected
# Reads models/aci_vrf_snmp_context_community.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_432 = yamldecode(file("${path.module}/../models/aci_vrf_snmp_context_community.yml"))["aci_vrf_snmp_context_community"]
}

resource "aci_vrf_snmp_context_community" "n432" {
  annotation          = local.m_432["annotation"]
  description         = local.m_432["description"]
  name                = local.m_432["name"]
  name_alias          = local.m_432["name_alias"]
  vrf_snmp_context_dn = local.m_432["vrf_snmp_context_dn"]
}
