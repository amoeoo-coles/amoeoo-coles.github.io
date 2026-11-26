# 333 · resource aci_ip_sla_track_member · 3. Tenant and networking
# Manages ACI IP SLA Track Member
# APIC class: fvTrackMember · DN: uni/tn-{name}/trackmember-{name}
# Reads models/aci_ip_sla_track_member.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_333 = yamldecode(file("${path.module}/../models/aci_ip_sla_track_member.yml"))["aci_ip_sla_track_member"]
}

resource "aci_ip_sla_track_member" "n333" {
  annotation                    = local.m_333["annotation"]
  annotations                   = local.m_333["annotations"]
  description                   = local.m_333["description"]
  destination_ip_address        = local.m_333["destination_ip_address"]
  name                          = local.m_333["name"]
  name_alias                    = local.m_333["name_alias"]
  owner_key                     = local.m_333["owner_key"]
  owner_tag                     = local.m_333["owner_tag"]
  parent_dn                     = local.m_333["parent_dn"]
  relation_to_monitoring_policy = local.m_333["relation_to_monitoring_policy"]
  scope                         = local.m_333["scope"]
  tags                          = local.m_333["tags"]
}
