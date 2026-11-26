# 529 · data source aci_relation_from_application_epg_to_attachable_access_entity_profile · 4. Application
# Data source for ACI Relation From Application EPG To Attachable Access Entity Profile
# APIC class: fvRsAepAtt · DN: uni/tn-{name}/ap-{name}/epg-{name}/rsaepAtt-{tnInfraAttEntityPName}
# Reads models/data_aci_relation_from_application_epg_to_attachable_access_entity_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_529 = yamldecode(file("${path.module}/../models/data_aci_relation_from_application_epg_to_attachable_access_entity_profile.yml"))["data_aci_relation_from_application_epg_to_attachable_access_entity_profile"]
}

data "aci_relation_from_application_epg_to_attachable_access_entity_profile" "n529" {
  attachable_access_entity_profile_name = local.m_529["attachable_access_entity_profile_name"]
  parent_dn                             = local.m_529["parent_dn"]
}

output "n529_data_aci_relation_from_application_epg_to_attachable_access_entity_profile_id" {
  value = data.aci_relation_from_application_epg_to_attachable_access_entity_profile.n529.id
}
