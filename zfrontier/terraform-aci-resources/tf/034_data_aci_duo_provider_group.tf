# 034 · data source aci_duo_provider_group · 1. System and fabric setup
# Data source for ACI Duo Provider Group
# APIC class: not collected · DN: not collected
# Reads models/data_aci_duo_provider_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_034 = yamldecode(file("${path.module}/../models/data_aci_duo_provider_group.yml"))["data_aci_duo_provider_group"]
}

data "aci_duo_provider_group" "n034" {
  annotation           = local.m_034["annotation"]
  auth_choice          = local.m_034["auth_choice"]
  description          = local.m_034["description"]
  ldap_group_map_ref   = local.m_034["ldap_group_map_ref"]
  name                 = local.m_034["name"]
  name_alias           = local.m_034["name_alias"]
  provider_type        = local.m_034["provider_type"]
  sec_fac_auth_methods = local.m_034["sec_fac_auth_methods"]
}

output "n034_data_aci_duo_provider_group_id" {
  value = data.aci_duo_provider_group.n034.id
}
