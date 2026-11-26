# 172 · data source aci_priority_flow_control_interface_policy · 2. Access policies
# Data source for ACI Priority Flow Control Interface Policy
# APIC class: qosPfcIfPol · DN: uni/infra/pfc-{name}
# Reads models/data_aci_priority_flow_control_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_172 = yamldecode(file("${path.module}/../models/data_aci_priority_flow_control_interface_policy.yml"))["data_aci_priority_flow_control_interface_policy"]
}

data "aci_priority_flow_control_interface_policy" "n172" {
  name = local.m_172["name"]
}

output "n172_data_aci_priority_flow_control_interface_policy_id" {
  value = data.aci_priority_flow_control_interface_policy.n172.id
}
