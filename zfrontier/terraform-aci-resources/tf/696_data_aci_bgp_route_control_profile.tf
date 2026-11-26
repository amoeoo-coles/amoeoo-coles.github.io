# 696 · data source aci_bgp_route_control_profile · 9. Other
# not collected
# APIC class: not collected · DN: not collected
# Reads models/data_aci_bgp_route_control_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_696 = yamldecode(file("${path.module}/../models/data_aci_bgp_route_control_profile.yml"))["data_aci_bgp_route_control_profile"]
}

data "aci_bgp_route_control_profile" "n696" {
  annotation                 = local.m_696["annotation"]
  description                = local.m_696["description"]
  name                       = local.m_696["name"]
  name_alias                 = local.m_696["name_alias"]
  parent_dn                  = local.m_696["parent_dn"]
  route_control_profile_type = local.m_696["route_control_profile_type"]
}

output "n696_data_aci_bgp_route_control_profile_id" {
  value = data.aci_bgp_route_control_profile.n696.id
}
