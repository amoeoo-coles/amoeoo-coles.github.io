# 331 · resource aci_ip_sla_track_list · 3. Tenant and networking
# Manages ACI IP SLA Track List
# APIC class: fvTrackList · DN: uni/tn-{name}/tracklist-{name}
# Reads models/aci_ip_sla_track_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_331 = yamldecode(file("${path.module}/../models/aci_ip_sla_track_list.yml"))["aci_ip_sla_track_list"]
}

resource "aci_ip_sla_track_list" "n331" {
  annotation                       = local.m_331["annotation"]
  annotations                      = local.m_331["annotations"]
  description                      = local.m_331["description"]
  name                             = local.m_331["name"]
  name_alias                       = local.m_331["name_alias"]
  owner_key                        = local.m_331["owner_key"]
  owner_tag                        = local.m_331["owner_tag"]
  parent_dn                        = local.m_331["parent_dn"]
  percentage_down                  = local.m_331["percentage_down"]
  percentage_up                    = local.m_331["percentage_up"]
  relation_to_ip_sla_track_members = local.m_331["relation_to_ip_sla_track_members"]
  tags                             = local.m_331["tags"]
  type                             = local.m_331["type"]
  weight_down                      = local.m_331["weight_down"]
  weight_up                        = local.m_331["weight_up"]
}
