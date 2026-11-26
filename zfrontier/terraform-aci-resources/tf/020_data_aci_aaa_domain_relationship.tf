# 020 · data source aci_aaa_domain_relationship · 1. System and fabric setup
# Data source for ACI AAA Domain Relationship for Parent Object
# APIC class: not collected · DN: not collected
# Reads models/data_aci_aaa_domain_relationship.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_020 = yamldecode(file("${path.module}/../models/data_aci_aaa_domain_relationship.yml"))["data_aci_aaa_domain_relationship"]
}

data "aci_aaa_domain_relationship" "n020" {
  aaa_domain_dn = local.m_020["aaa_domain_dn"]
  annotation    = local.m_020["annotation"]
  description   = local.m_020["description"]
  name_alias    = local.m_020["name_alias"]
  parent_dn     = local.m_020["parent_dn"]
}

output "n020_data_aci_aaa_domain_relationship_id" {
  value = data.aci_aaa_domain_relationship.n020.id
}
