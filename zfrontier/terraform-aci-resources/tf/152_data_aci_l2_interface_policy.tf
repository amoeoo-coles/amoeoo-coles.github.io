# 152 · data source aci_l2_interface_policy · 2. Access policies
# Data source for ACI L2 Interface Policy
# APIC class: l2IfPol · DN: uni/infra/l2IfP-{name}
# Reads models/data_aci_l2_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_152 = yamldecode(file("${path.module}/../models/data_aci_l2_interface_policy.yml"))["data_aci_l2_interface_policy"]
}

data "aci_l2_interface_policy" "n152" {
  name = local.m_152["name"]
}

output "n152_data_aci_l2_interface_policy_id" {
  value = data.aci_l2_interface_policy.n152.id
}
