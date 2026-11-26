# 431 · data source aci_vrf_fallback_route_group_member · 3. Tenant and networking
# Data source for ACI VRF Fallback Route Group Member
# APIC class: fvFBRMember · DN: uni/tn-{name}/ctx-{name}/fbrg-{name}/nexthop-[{rnhAddr}]
# Reads models/data_aci_vrf_fallback_route_group_member.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_431 = yamldecode(file("${path.module}/../models/data_aci_vrf_fallback_route_group_member.yml"))["data_aci_vrf_fallback_route_group_member"]
}

data "aci_vrf_fallback_route_group_member" "n431" {
  fallback_member = local.m_431["fallback_member"]
  parent_dn       = local.m_431["parent_dn"]
}

output "n431_data_aci_vrf_fallback_route_group_member_id" {
  value = data.aci_vrf_fallback_route_group_member.n431.id
}
