# 493 · resource aci_l3out_static_route_next_hop · 3. Tenant and networking
# Manages ACI L3out Static Route Next Hop
# APIC class: not collected · DN: not collected
# Reads models/aci_l3out_static_route_next_hop.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_493 = yamldecode(file("${path.module}/../models/aci_l3out_static_route_next_hop.yml"))["aci_l3out_static_route_next_hop"]
}

resource "aci_l3out_static_route_next_hop" "n493" {
  annotation                         = local.m_493["annotation"]
  description                        = local.m_493["description"]
  name_alias                         = local.m_493["name_alias"]
  nexthop_profile_type               = local.m_493["nexthop_profile_type"]
  nh_addr                            = local.m_493["nh_addr"]
  pref                               = local.m_493["pref"]
  relation_ip_rs_nexthop_route_track = local.m_493["relation_ip_rs_nexthop_route_track"]
  relation_ip_rs_nh_track_member     = local.m_493["relation_ip_rs_nh_track_member"]
  static_route_dn                    = local.m_493["static_route_dn"]
}
