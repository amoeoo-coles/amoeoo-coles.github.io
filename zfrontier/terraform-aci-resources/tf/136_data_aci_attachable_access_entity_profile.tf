# 136 · data source aci_attachable_access_entity_profile · 2. Access policies
# Data source for ACI Attachable Access Entity Profile
# APIC class: infraAttEntityP · DN: uni/infra/attentp-{name}
# Reads models/data_aci_attachable_access_entity_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_136 = yamldecode(file("${path.module}/../models/data_aci_attachable_access_entity_profile.yml"))["data_aci_attachable_access_entity_profile"]
}

data "aci_attachable_access_entity_profile" "n136" {
  name = local.m_136["name"]
}

output "n136_data_aci_attachable_access_entity_profile_id" {
  value = data.aci_attachable_access_entity_profile.n136.id
}
