# 437 · resource aci_route_control_profile · 3. Tenant and networking
# Manages ACI Route Control Profile
# APIC class: rtctrlProfile · DN: uni/tn-{name}/out-{name}/prof-{name} | uni/tn-{name}/prof-{name}
# Reads models/aci_route_control_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_437 = yamldecode(file("${path.module}/../models/aci_route_control_profile.yml"))["aci_route_control_profile"]
}

resource "aci_route_control_profile" "n437" {
  annotation                 = local.m_437["annotation"]
  annotations                = local.m_437["annotations"]
  description                = local.m_437["description"]
  name                       = local.m_437["name"]
  name_alias                 = local.m_437["name_alias"]
  owner_key                  = local.m_437["owner_key"]
  owner_tag                  = local.m_437["owner_tag"]
  parent_dn                  = local.m_437["parent_dn"]
  route_control_profile_type = local.m_437["route_control_profile_type"]
  route_map_continue         = local.m_437["route_map_continue"]
  tags                       = local.m_437["tags"]
}
