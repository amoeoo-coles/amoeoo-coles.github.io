# 090 · resource aci_snmp_user · 1. System and fabric setup
# Manages ACI SNMP User
# APIC class: not collected · DN: not collected
# Reads models/aci_snmp_user.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_090 = yamldecode(file("${path.module}/../models/aci_snmp_user.yml"))["aci_snmp_user"]
}

resource "aci_snmp_user" "n090" {
  annotation         = local.m_090["annotation"]
  authorization_key  = local.m_090["authorization_key"]
  authorization_type = local.m_090["authorization_type"]
  description        = local.m_090["description"]
  name               = local.m_090["name"]
  name_alias         = local.m_090["name_alias"]
  privacy_key        = local.m_090["privacy_key"]
  privacy_type       = local.m_090["privacy_type"]
  snmp_policy_dn     = local.m_090["snmp_policy_dn"]
}
