# 445 · resource aci_l3out_consumer_label · 3. Tenant and networking
# Manages ACI L3Out Consumer Label
# APIC class: l3extConsLbl · DN: uni/tn-{name}/out-{name}/conslbl-{name}
# Reads models/aci_l3out_consumer_label.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_445 = yamldecode(file("${path.module}/../models/aci_l3out_consumer_label.yml"))["aci_l3out_consumer_label"]
}

resource "aci_l3out_consumer_label" "n445" {
  annotation                         = local.m_445["annotation"]
  annotations                        = local.m_445["annotations"]
  description                        = local.m_445["description"]
  name                               = local.m_445["name"]
  name_alias                         = local.m_445["name_alias"]
  owner                              = local.m_445["owner"]
  owner_key                          = local.m_445["owner_key"]
  owner_tag                          = local.m_445["owner_tag"]
  parent_dn                          = local.m_445["parent_dn"]
  relation_to_external_epgs          = local.m_445["relation_to_external_epgs"]
  relation_to_route_control_profiles = local.m_445["relation_to_route_control_profiles"]
  tag                                = local.m_445["tag"]
  tags                               = local.m_445["tags"]
}
