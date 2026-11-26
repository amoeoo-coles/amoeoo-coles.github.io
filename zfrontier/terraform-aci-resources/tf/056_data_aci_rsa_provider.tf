# 056 · data source aci_rsa_provider · 1. System and fabric setup
# Data source for ACI RSA Provider
# APIC class: not collected · DN: not collected
# Reads models/data_aci_rsa_provider.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_056 = yamldecode(file("${path.module}/../models/data_aci_rsa_provider.yml"))["data_aci_rsa_provider"]
}

data "aci_rsa_provider" "n056" {
  annotation          = local.m_056["annotation"]
  auth_port           = local.m_056["auth_port"]
  auth_protocol       = local.m_056["auth_protocol"]
  description         = local.m_056["description"]
  key                 = local.m_056["key"]
  monitor_server      = local.m_056["monitor_server"]
  monitoring_password = local.m_056["monitoring_password"]
  monitoring_user     = local.m_056["monitoring_user"]
  name                = local.m_056["name"]
  name_alias          = local.m_056["name_alias"]
  retries             = local.m_056["retries"]
  timeout             = local.m_056["timeout"]
}

output "n056_data_aci_rsa_provider_id" {
  value = data.aci_rsa_provider.n056.id
}
