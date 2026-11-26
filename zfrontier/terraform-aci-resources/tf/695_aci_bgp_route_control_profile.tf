# 695 · resource aci_bgp_route_control_profile · 9. Other
# not collected
# APIC class: not collected · DN: not collected
# Reads models/aci_bgp_route_control_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_695 = yamldecode(file("${path.module}/../models/aci_bgp_route_control_profile.yml"))["aci_bgp_route_control_profile"]
}

resource "aci_bgp_route_control_profile" "n695" {
  annotation                 = local.m_695["annotation"]
  description                = local.m_695["description"]
  name                       = local.m_695["name"]
  name_alias                 = local.m_695["name_alias"]
  parent_dn                  = local.m_695["parent_dn"]
  route_control_profile_type = local.m_695["route_control_profile_type"]
}
