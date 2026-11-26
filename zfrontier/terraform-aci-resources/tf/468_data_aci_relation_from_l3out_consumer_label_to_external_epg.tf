# 468 · data source aci_relation_from_l3out_consumer_label_to_external_epg · 3. Tenant and networking
# Data source for ACI Relation From L3Out Consumer Label To External EPG
# APIC class: l3extRsLblToInstP · DN: uni/tn-{name}/out-{name}/conslbl-{name}/rslblToInstP-[{tDn}]
# Reads models/data_aci_relation_from_l3out_consumer_label_to_external_epg.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_468 = yamldecode(file("${path.module}/../models/data_aci_relation_from_l3out_consumer_label_to_external_epg.yml"))["data_aci_relation_from_l3out_consumer_label_to_external_epg"]
}

data "aci_relation_from_l3out_consumer_label_to_external_epg" "n468" {
  parent_dn = local.m_468["parent_dn"]
  target_dn = local.m_468["target_dn"]
}

output "n468_data_aci_relation_from_l3out_consumer_label_to_external_epg_id" {
  value = data.aci_relation_from_l3out_consumer_label_to_external_epg.n468.id
}
