# 494 · data source aci_l3out_static_route_next_hop · 3. Tenant and networking
# Data source for ACI L3out Static Route Next Hop
# APIC class: not collected · DN: not collected
# Reads models/data_aci_l3out_static_route_next_hop.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_494 = yamldecode(file("${path.module}/../models/data_aci_l3out_static_route_next_hop.yml"))["data_aci_l3out_static_route_next_hop"]
}

data "aci_l3out_static_route_next_hop" "n494" {
  annotation           = local.m_494["annotation"]
  description          = local.m_494["description"]
  name_alias           = local.m_494["name_alias"]
  nexthop_profile_type = local.m_494["nexthop_profile_type"]
  nh_addr              = local.m_494["nh_addr"]
  pref                 = local.m_494["pref"]
  static_route_dn      = local.m_494["static_route_dn"]
}

output "n494_data_aci_l3out_static_route_next_hop_id" {
  value = data.aci_l3out_static_route_next_hop.n494.id
}
