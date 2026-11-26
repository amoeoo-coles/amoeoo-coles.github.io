# 465 · resource aci_relation_from_external_epg_to_route_control_profile · 3. Tenant and networking
# Manages ACI Relation From External EPG To Route Control Profile
# APIC class: l3extRsInstPToProfile · DN: uni/tn-{name}/out-{name}/instP-{name}/rsinstPToProfile-[{tnRtctrlProfileName}]-{direction}
# Reads models/aci_relation_from_external_epg_to_route_control_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_465 = yamldecode(file("${path.module}/../models/aci_relation_from_external_epg_to_route_control_profile.yml"))["aci_relation_from_external_epg_to_route_control_profile"]
}

resource "aci_relation_from_external_epg_to_route_control_profile" "n465" {
  annotation                 = local.m_465["annotation"]
  annotations                = local.m_465["annotations"]
  direction                  = local.m_465["direction"]
  parent_dn                  = local.m_465["parent_dn"]
  route_control_profile_name = local.m_465["route_control_profile_name"]
  tags                       = local.m_465["tags"]
}
