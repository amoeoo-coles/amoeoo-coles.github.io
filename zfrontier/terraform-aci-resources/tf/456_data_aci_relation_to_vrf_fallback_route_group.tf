# 456 · data source aci_relation_to_vrf_fallback_route_group · 3. Tenant and networking
# Data source for ACI Relation To VRF Fallback Route Group
# APIC class: l3extRsOutToFBRGroup · DN: uni/tn-{name}/out-{name}/rsoutToFBRGroup-[{tDn}]
# Reads models/data_aci_relation_to_vrf_fallback_route_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_456 = yamldecode(file("${path.module}/../models/data_aci_relation_to_vrf_fallback_route_group.yml"))["data_aci_relation_to_vrf_fallback_route_group"]
}

data "aci_relation_to_vrf_fallback_route_group" "n456" {
  parent_dn = local.m_456["parent_dn"]
  target_dn = local.m_456["target_dn"]
}

output "n456_data_aci_relation_to_vrf_fallback_route_group_id" {
  value = data.aci_relation_to_vrf_fallback_route_group.n456.id
}
