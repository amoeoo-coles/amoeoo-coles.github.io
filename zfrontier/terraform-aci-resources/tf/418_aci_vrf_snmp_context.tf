# 418 · resource aci_vrf_snmp_context · 3. Tenant and networking
# Manages ACI VRF SNMP Context
# APIC class: not collected · DN: not collected
# Reads models/aci_vrf_snmp_context.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_418 = yamldecode(file("${path.module}/../models/aci_vrf_snmp_context.yml"))["aci_vrf_snmp_context"]
}

resource "aci_vrf_snmp_context" "n418" {
  annotation = local.m_418["annotation"]
  name       = local.m_418["name"]
  name_alias = local.m_418["name_alias"]
  vrf_dn     = local.m_418["vrf_dn"]
}
