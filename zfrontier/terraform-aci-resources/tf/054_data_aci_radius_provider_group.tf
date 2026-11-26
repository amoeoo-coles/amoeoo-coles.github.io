# 054 · data source aci_radius_provider_group · 1. System and fabric setup
# Data source for ACI RADIUS Provider Group
# APIC class: not collected · DN: not collected
# Reads models/data_aci_radius_provider_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_054 = yamldecode(file("${path.module}/../models/data_aci_radius_provider_group.yml"))["data_aci_radius_provider_group"]
}

data "aci_radius_provider_group" "n054" {
  annotation  = local.m_054["annotation"]
  description = local.m_054["description"]
  name        = local.m_054["name"]
  name_alias  = local.m_054["name_alias"]
}

output "n054_data_aci_radius_provider_group_id" {
  value = data.aci_radius_provider_group.n054.id
}
