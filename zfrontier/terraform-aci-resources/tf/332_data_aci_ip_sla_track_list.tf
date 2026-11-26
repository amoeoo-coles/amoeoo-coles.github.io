# 332 · data source aci_ip_sla_track_list · 3. Tenant and networking
# Data source for ACI IP SLA Track List
# APIC class: fvTrackList · DN: uni/tn-{name}/tracklist-{name}
# Reads models/data_aci_ip_sla_track_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_332 = yamldecode(file("${path.module}/../models/data_aci_ip_sla_track_list.yml"))["data_aci_ip_sla_track_list"]
}

data "aci_ip_sla_track_list" "n332" {
  name      = local.m_332["name"]
  parent_dn = local.m_332["parent_dn"]
}

output "n332_data_aci_ip_sla_track_list_id" {
  value = data.aci_ip_sla_track_list.n332.id
}
