# 433 · data source aci_vrf_snmp_context_community · 3. Tenant and networking
# Data source for ACI SNMP Community
# APIC class: not collected · DN: not collected
# Reads models/data_aci_vrf_snmp_context_community.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_433 = yamldecode(file("${path.module}/../models/data_aci_vrf_snmp_context_community.yml"))["data_aci_vrf_snmp_context_community"]
}

data "aci_vrf_snmp_context_community" "n433" {
  annotation          = local.m_433["annotation"]
  description         = local.m_433["description"]
  name                = local.m_433["name"]
  name_alias          = local.m_433["name_alias"]
  vrf_snmp_context_dn = local.m_433["vrf_snmp_context_dn"]
}

output "n433_data_aci_vrf_snmp_context_community_id" {
  value = data.aci_vrf_snmp_context_community.n433.id
}
