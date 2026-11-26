# 043 · resource aci_ldap_provider · 1. System and fabric setup
# Manages ACI LDAP Provider
# APIC class: not collected · DN: not collected
# Reads models/aci_ldap_provider.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_043 = yamldecode(file("${path.module}/../models/aci_ldap_provider.yml"))["aci_ldap_provider"]
}

resource "aci_ldap_provider" "n043" {
  annotation                      = local.m_043["annotation"]
  attribute                       = local.m_043["attribute"]
  basedn                          = local.m_043["basedn"]
  description                     = local.m_043["description"]
  enable_ssl                      = local.m_043["enable_ssl"]
  filter                          = local.m_043["filter"]
  key                             = local.m_043["key"]
  monitor_server                  = local.m_043["monitor_server"]
  monitoring_password             = local.m_043["monitoring_password"]
  monitoring_user                 = local.m_043["monitoring_user"]
  name                            = local.m_043["name"]
  name_alias                      = local.m_043["name_alias"]
  port                            = local.m_043["port"]
  relation_aaa_rs_prov_to_epp     = local.m_043["relation_aaa_rs_prov_to_epp"]
  relation_aaa_rs_sec_prov_to_epg = local.m_043["relation_aaa_rs_sec_prov_to_epg"]
  retries                         = local.m_043["retries"]
  rootdn                          = local.m_043["rootdn"]
  ssl_validation_level            = local.m_043["ssl_validation_level"]
  timeout                         = local.m_043["timeout"]
  type                            = local.m_043["type"]
}
