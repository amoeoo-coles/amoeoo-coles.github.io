# 383 · resource aci_relation_to_ip_sla_track_member · 3. Tenant and networking
# Manages ACI Relation To IP SLA Track Member
# APIC class: fvRsOtmListMember · DN: uni/tn-{name}/tracklist-{name}/rsotmListMember-[{tDn}]
# Reads models/aci_relation_to_ip_sla_track_member.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_383 = yamldecode(file("${path.module}/../models/aci_relation_to_ip_sla_track_member.yml"))["aci_relation_to_ip_sla_track_member"]
}

resource "aci_relation_to_ip_sla_track_member" "n383" {
  annotation  = local.m_383["annotation"]
  annotations = local.m_383["annotations"]
  parent_dn   = local.m_383["parent_dn"]
  tags        = local.m_383["tags"]
  target_dn   = local.m_383["target_dn"]
  weight      = local.m_383["weight"]
}
