# 168 · data source aci_poe_interface_policy · 2. Access policies
# Data source for ACI PoE Interface Policy
# APIC class: poeIfPol · DN: uni/infra/poeIfP-{name}
# Reads models/data_aci_poe_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_168 = yamldecode(file("${path.module}/../models/data_aci_poe_interface_policy.yml"))["data_aci_poe_interface_policy"]
}

data "aci_poe_interface_policy" "n168" {
  name = local.m_168["name"]
}

output "n168_data_aci_poe_interface_policy_id" {
  value = data.aci_poe_interface_policy.n168.id
}
