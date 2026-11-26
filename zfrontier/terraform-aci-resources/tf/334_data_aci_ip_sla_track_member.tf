# 334 · data source aci_ip_sla_track_member · 3. Tenant and networking
# Data source for ACI IP SLA Track Member
# APIC class: fvTrackMember · DN: uni/tn-{name}/trackmember-{name}
# Reads models/data_aci_ip_sla_track_member.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_334 = yamldecode(file("${path.module}/../models/data_aci_ip_sla_track_member.yml"))["data_aci_ip_sla_track_member"]
}

data "aci_ip_sla_track_member" "n334" {
  name      = local.m_334["name"]
  parent_dn = local.m_334["parent_dn"]
}

output "n334_data_aci_ip_sla_track_member_id" {
  value = data.aci_ip_sla_track_member.n334.id
}
