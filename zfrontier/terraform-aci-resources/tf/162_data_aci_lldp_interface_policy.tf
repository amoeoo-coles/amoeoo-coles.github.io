# 162 · data source aci_lldp_interface_policy · 2. Access policies
# Data source for ACI LLDP Interface Policy
# APIC class: lldpIfPol · DN: uni/infra/lldpIfP-{name}
# Reads models/data_aci_lldp_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_162 = yamldecode(file("${path.module}/../models/data_aci_lldp_interface_policy.yml"))["data_aci_lldp_interface_policy"]
}

data "aci_lldp_interface_policy" "n162" {
  name = local.m_162["name"]
}

output "n162_data_aci_lldp_interface_policy_id" {
  value = data.aci_lldp_interface_policy.n162.id
}
