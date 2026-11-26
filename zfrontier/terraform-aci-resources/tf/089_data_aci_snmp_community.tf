# 089 · data source aci_snmp_community · 1. System and fabric setup
# Data source for ACI SNMP Community
# APIC class: not collected · DN: not collected
# Reads models/data_aci_snmp_community.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_089 = yamldecode(file("${path.module}/../models/data_aci_snmp_community.yml"))["data_aci_snmp_community"]
}

data "aci_snmp_community" "n089" {
  annotation  = local.m_089["annotation"]
  description = local.m_089["description"]
  name        = local.m_089["name"]
  name_alias  = local.m_089["name_alias"]
  parent_dn   = local.m_089["parent_dn"]
}

output "n089_data_aci_snmp_community_id" {
  value = data.aci_snmp_community.n089.id
}
