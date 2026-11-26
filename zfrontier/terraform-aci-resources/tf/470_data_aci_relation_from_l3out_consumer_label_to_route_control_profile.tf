# 470 · data source aci_relation_from_l3out_consumer_label_to_route_control_profile · 3. Tenant and networking
# Data source for ACI Relation From L3Out Consumer Label To Route Control Profile
# APIC class: l3extRsLblToProfile · DN: uni/tn-{name}/out-{name}/conslbl-{name}/rslblToProfile-[{tDn}]-{direction}
# Reads models/data_aci_relation_from_l3out_consumer_label_to_route_control_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_470 = yamldecode(file("${path.module}/../models/data_aci_relation_from_l3out_consumer_label_to_route_control_profile.yml"))["data_aci_relation_from_l3out_consumer_label_to_route_control_profile"]
}

data "aci_relation_from_l3out_consumer_label_to_route_control_profile" "n470" {
  direction = local.m_470["direction"]
  parent_dn = local.m_470["parent_dn"]
  target_dn = local.m_470["target_dn"]
}

output "n470_data_aci_relation_from_l3out_consumer_label_to_route_control_profile_id" {
  value = data.aci_relation_from_l3out_consumer_label_to_route_control_profile.n470.id
}
