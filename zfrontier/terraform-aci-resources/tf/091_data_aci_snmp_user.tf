# 091 · data source aci_snmp_user · 1. System and fabric setup
# Data source for ACI SNMP User
# APIC class: not collected · DN: not collected
# Reads models/data_aci_snmp_user.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_091 = yamldecode(file("${path.module}/../models/data_aci_snmp_user.yml"))["data_aci_snmp_user"]
}

data "aci_snmp_user" "n091" {
  annotation     = local.m_091["annotation"]
  description    = local.m_091["description"]
  name           = local.m_091["name"]
  name_alias     = local.m_091["name_alias"]
  snmp_policy_dn = local.m_091["snmp_policy_dn"]
}

output "n091_data_aci_snmp_user_id" {
  value = data.aci_snmp_user.n091.id
}
