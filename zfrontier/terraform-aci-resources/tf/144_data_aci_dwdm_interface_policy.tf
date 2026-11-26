# 144 · data source aci_dwdm_interface_policy · 2. Access policies
# Data source for ACI DWDM Interface Policy
# APIC class: dwdmIfPol · DN: uni/infra/dwdmifpol-{name}
# Reads models/data_aci_dwdm_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_144 = yamldecode(file("${path.module}/../models/data_aci_dwdm_interface_policy.yml"))["data_aci_dwdm_interface_policy"]
}

data "aci_dwdm_interface_policy" "n144" {
  name = local.m_144["name"]
}

output "n144_data_aci_dwdm_interface_policy_id" {
  value = data.aci_dwdm_interface_policy.n144.id
}
