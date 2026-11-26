# 032 · data source aci_default_authentication · 1. System and fabric setup
# Data source for ACI Default Authentication Method for all Logins
# APIC class: not collected · DN: not collected
# Reads models/data_aci_default_authentication.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_032 = yamldecode(file("${path.module}/../models/data_aci_default_authentication.yml"))["data_aci_default_authentication"]
}

data "aci_default_authentication" "n032" {
  annotation     = local.m_032["annotation"]
  description    = local.m_032["description"]
  fallback_check = local.m_032["fallback_check"]
  name_alias     = local.m_032["name_alias"]
  provider_group = local.m_032["provider_group"]
  realm          = local.m_032["realm"]
  realm_sub_type = local.m_032["realm_sub_type"]
}

output "n032_data_aci_default_authentication_id" {
  value = data.aci_default_authentication.n032.id
}
