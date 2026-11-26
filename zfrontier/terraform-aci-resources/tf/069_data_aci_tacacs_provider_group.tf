# 069 · data source aci_tacacs_provider_group · 1. System and fabric setup
# Data source for ACI TACACS + Provider Group
# APIC class: not collected · DN: not collected
# Reads models/data_aci_tacacs_provider_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_069 = yamldecode(file("${path.module}/../models/data_aci_tacacs_provider_group.yml"))["data_aci_tacacs_provider_group"]
}

data "aci_tacacs_provider_group" "n069" {
  annotation  = local.m_069["annotation"]
  description = local.m_069["description"]
  name        = local.m_069["name"]
  name_alias  = local.m_069["name_alias"]
}

output "n069_data_aci_tacacs_provider_group_id" {
  value = data.aci_tacacs_provider_group.n069.id
}
