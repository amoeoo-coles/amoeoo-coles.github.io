# 180 · data source aci_synce_interface_policy · 2. Access policies
# Data source for ACI SyncE Interface Policy
# APIC class: synceEthIfPol · DN: uni/infra/synceEthIfP-{name}
# Reads models/data_aci_synce_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_180 = yamldecode(file("${path.module}/../models/data_aci_synce_interface_policy.yml"))["data_aci_synce_interface_policy"]
}

data "aci_synce_interface_policy" "n180" {
  name = local.m_180["name"]
}

output "n180_data_aci_synce_interface_policy_id" {
  value = data.aci_synce_interface_policy.n180.id
}
