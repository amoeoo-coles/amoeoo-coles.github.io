# 528 · resource aci_relation_from_application_epg_to_attachable_access_entity_profile · 4. Application
# Manages ACI Relation From Application EPG To Attachable Access Entity Profile
# APIC class: fvRsAepAtt · DN: uni/tn-{name}/ap-{name}/epg-{name}/rsaepAtt-{tnInfraAttEntityPName}
# Reads models/aci_relation_from_application_epg_to_attachable_access_entity_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_528 = yamldecode(file("${path.module}/../models/aci_relation_from_application_epg_to_attachable_access_entity_profile.yml"))["aci_relation_from_application_epg_to_attachable_access_entity_profile"]
}

resource "aci_relation_from_application_epg_to_attachable_access_entity_profile" "n528" {
  annotations                           = local.m_528["annotations"]
  attachable_access_entity_profile_name = local.m_528["attachable_access_entity_profile_name"]
  deployment_immediacy                  = local.m_528["deployment_immediacy"]
  encapsulation                         = local.m_528["encapsulation"]
  mode                                  = local.m_528["mode"]
  parent_dn                             = local.m_528["parent_dn"]
  primary_encapsulation                 = local.m_528["primary_encapsulation"]
  tags                                  = local.m_528["tags"]
}
