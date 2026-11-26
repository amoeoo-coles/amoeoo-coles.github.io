# 537 · data source aci_relation_to_fibre_channel_path · 4. Application
# Data source for ACI Relation To Fibre Channel Path
# APIC class: fvRsFcPathAtt · DN: uni/tn-{name}/ap-{name}/epg-{name}/rsfcPathAtt-[{tDn}]
# Reads models/data_aci_relation_to_fibre_channel_path.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_537 = yamldecode(file("${path.module}/../models/data_aci_relation_to_fibre_channel_path.yml"))["data_aci_relation_to_fibre_channel_path"]
}

data "aci_relation_to_fibre_channel_path" "n537" {
  parent_dn = local.m_537["parent_dn"]
  target_dn = local.m_537["target_dn"]
}

output "n537_data_aci_relation_to_fibre_channel_path_id" {
  value = data.aci_relation_to_fibre_channel_path.n537.id
}
