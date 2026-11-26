# 178 · data source aci_spine_interface_profile · 2. Access policies
# Data source for ACI Spine Interface Profile
# APIC class: infraSpAccPortP · DN: uni/infra/spaccportprof-{name}
# Reads models/data_aci_spine_interface_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_178 = yamldecode(file("${path.module}/../models/data_aci_spine_interface_profile.yml"))["data_aci_spine_interface_profile"]
}

data "aci_spine_interface_profile" "n178" {
  name = local.m_178["name"]
}

output "n178_data_aci_spine_interface_profile_id" {
  value = data.aci_spine_interface_profile.n178.id
}
