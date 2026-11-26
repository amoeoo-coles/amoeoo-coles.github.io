# 030 · data source aci_console_authentication · 1. System and fabric setup
# Data source for ACI Console Authentication
# APIC class: not collected · DN: not collected
# Reads models/data_aci_console_authentication.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_030 = yamldecode(file("${path.module}/../models/data_aci_console_authentication.yml"))["data_aci_console_authentication"]
}

data "aci_console_authentication" "n030" {
  annotation     = local.m_030["annotation"]
  description    = local.m_030["description"]
  name_alias     = local.m_030["name_alias"]
  provider_group = local.m_030["provider_group"]
  realm          = local.m_030["realm"]
  realm_sub_type = local.m_030["realm_sub_type"]
}

output "n030_data_aci_console_authentication_id" {
  value = data.aci_console_authentication.n030.id
}
