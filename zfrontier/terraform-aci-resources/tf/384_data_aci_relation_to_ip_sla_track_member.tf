# 384 · data source aci_relation_to_ip_sla_track_member · 3. Tenant and networking
# Data source for ACI Relation To IP SLA Track Member
# APIC class: fvRsOtmListMember · DN: uni/tn-{name}/tracklist-{name}/rsotmListMember-[{tDn}]
# Reads models/data_aci_relation_to_ip_sla_track_member.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_384 = yamldecode(file("${path.module}/../models/data_aci_relation_to_ip_sla_track_member.yml"))["data_aci_relation_to_ip_sla_track_member"]
}

data "aci_relation_to_ip_sla_track_member" "n384" {
  parent_dn = local.m_384["parent_dn"]
  target_dn = local.m_384["target_dn"]
}

output "n384_data_aci_relation_to_ip_sla_track_member_id" {
  value = data.aci_relation_to_ip_sla_track_member.n384.id
}
