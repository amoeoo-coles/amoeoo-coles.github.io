# 466 · data source aci_relation_from_external_epg_to_route_control_profile · 3. Tenant and networking
# Data source for ACI Relation From External EPG To Route Control Profile
# APIC class: l3extRsInstPToProfile · DN: uni/tn-{name}/out-{name}/instP-{name}/rsinstPToProfile-[{tnRtctrlProfileName}]-{direction}
# Reads models/data_aci_relation_from_external_epg_to_route_control_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_466 = yamldecode(file("${path.module}/../models/data_aci_relation_from_external_epg_to_route_control_profile.yml"))["data_aci_relation_from_external_epg_to_route_control_profile"]
}

data "aci_relation_from_external_epg_to_route_control_profile" "n466" {
  direction                  = local.m_466["direction"]
  parent_dn                  = local.m_466["parent_dn"]
  route_control_profile_name = local.m_466["route_control_profile_name"]
}

output "n466_data_aci_relation_from_external_epg_to_route_control_profile_id" {
  value = data.aci_relation_from_external_epg_to_route_control_profile.n466.id
}
