# 160 · data source aci_link_level_interface_policy · 2. Access policies
# Data source for ACI Link Level Interface Policy
# APIC class: fabricHIfPol · DN: uni/infra/hintfpol-{name}
# Reads models/data_aci_link_level_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_160 = yamldecode(file("${path.module}/../models/data_aci_link_level_interface_policy.yml"))["data_aci_link_level_interface_policy"]
}

data "aci_link_level_interface_policy" "n160" {
  name = local.m_160["name"]
}

output "n160_data_aci_link_level_interface_policy_id" {
  value = data.aci_link_level_interface_policy.n160.id
}
