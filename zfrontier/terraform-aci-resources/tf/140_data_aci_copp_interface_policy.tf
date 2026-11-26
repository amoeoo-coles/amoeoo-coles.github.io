# 140 · data source aci_copp_interface_policy · 2. Access policies
# Data source for ACI CoPP Interface Policy
# APIC class: coppIfPol · DN: uni/infra/coppifpol-{name}
# Reads models/data_aci_copp_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_140 = yamldecode(file("${path.module}/../models/data_aci_copp_interface_policy.yml"))["data_aci_copp_interface_policy"]
}

data "aci_copp_interface_policy" "n140" {
  name = local.m_140["name"]
}

output "n140_data_aci_copp_interface_policy_id" {
  value = data.aci_copp_interface_policy.n140.id
}
