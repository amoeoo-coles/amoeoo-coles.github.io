# 419 · data source aci_vrf_snmp_context · 3. Tenant and networking
# Data source for ACI VRF SNMP Context
# APIC class: not collected · DN: not collected
# Reads models/data_aci_vrf_snmp_context.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_419 = yamldecode(file("${path.module}/../models/data_aci_vrf_snmp_context.yml"))["data_aci_vrf_snmp_context"]
}

data "aci_vrf_snmp_context" "n419" {
  annotation = local.m_419["annotation"]
  name       = local.m_419["name"]
  name_alias = local.m_419["name_alias"]
  vrf_dn     = local.m_419["vrf_dn"]
}

output "n419_data_aci_vrf_snmp_context_id" {
  value = data.aci_vrf_snmp_context.n419.id
}
