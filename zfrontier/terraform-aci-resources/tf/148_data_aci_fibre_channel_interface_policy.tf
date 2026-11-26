# 148 · data source aci_fibre_channel_interface_policy · 2. Access policies
# Data source for ACI Fibre Channel Interface Policy
# APIC class: fcIfPol · DN: uni/infra/fcIfPol-{name}
# Reads models/data_aci_fibre_channel_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_148 = yamldecode(file("${path.module}/../models/data_aci_fibre_channel_interface_policy.yml"))["data_aci_fibre_channel_interface_policy"]
}

data "aci_fibre_channel_interface_policy" "n148" {
  name = local.m_148["name"]
}

output "n148_data_aci_fibre_channel_interface_policy_id" {
  value = data.aci_fibre_channel_interface_policy.n148.id
}
