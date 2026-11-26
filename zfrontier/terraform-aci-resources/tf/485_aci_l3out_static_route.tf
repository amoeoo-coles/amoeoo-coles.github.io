# 485 · resource aci_l3out_static_route · 3. Tenant and networking
# Manages ACI L3out Static Route
# APIC class: not collected · DN: not collected
# Reads models/aci_l3out_static_route.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_485 = yamldecode(file("${path.module}/../models/aci_l3out_static_route.yml"))["aci_l3out_static_route"]
}

resource "aci_l3out_static_route" "n485" {
  aggregate                  = local.m_485["aggregate"]
  annotation                 = local.m_485["annotation"]
  description                = local.m_485["description"]
  fabric_node_dn             = local.m_485["fabric_node_dn"]
  ip                         = local.m_485["ip"]
  name_alias                 = local.m_485["name_alias"]
  pref                       = local.m_485["pref"]
  relation_ip_rs_route_track = local.m_485["relation_ip_rs_route_track"]
  rt_ctrl                    = local.m_485["rt_ctrl"]
}
