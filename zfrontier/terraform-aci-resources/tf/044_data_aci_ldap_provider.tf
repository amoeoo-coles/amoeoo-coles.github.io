# 044 · data source aci_ldap_provider · 1. System and fabric setup
# Data source for ACI LDAP Provider
# APIC class: not collected · DN: not collected
# Reads models/data_aci_ldap_provider.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_044 = yamldecode(file("${path.module}/../models/data_aci_ldap_provider.yml"))["data_aci_ldap_provider"]
}

data "aci_ldap_provider" "n044" {
  annotation           = local.m_044["annotation"]
  attribute            = local.m_044["attribute"]
  basedn               = local.m_044["basedn"]
  description          = local.m_044["description"]
  enable_ssl           = local.m_044["enable_ssl"]
  filter               = local.m_044["filter"]
  monitor_server       = local.m_044["monitor_server"]
  monitoring_user      = local.m_044["monitoring_user"]
  name                 = local.m_044["name"]
  name_alias           = local.m_044["name_alias"]
  port                 = local.m_044["port"]
  retries              = local.m_044["retries"]
  rootdn               = local.m_044["rootdn"]
  ssl_validation_level = local.m_044["ssl_validation_level"]
  timeout              = local.m_044["timeout"]
  type                 = local.m_044["type"]
}

output "n044_data_aci_ldap_provider_id" {
  value = data.aci_ldap_provider.n044.id
}
