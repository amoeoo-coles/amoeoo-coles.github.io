# 154 · data source aci_leaf_interface_profile · 2. Access policies
# Data source for ACI Leaf Interface Profile
# APIC class: infraAccPortP · DN: uni/infra/accportprof-{name}
# Reads models/data_aci_leaf_interface_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_154 = yamldecode(file("${path.module}/../models/data_aci_leaf_interface_profile.yml"))["data_aci_leaf_interface_profile"]
}

data "aci_leaf_interface_profile" "n154" {
  name = local.m_154["name"]
}

output "n154_data_aci_leaf_interface_profile_id" {
  value = data.aci_leaf_interface_profile.n154.id
}
