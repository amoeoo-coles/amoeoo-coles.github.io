# 158 · data source aci_link_level_flow_control_interface_policy · 2. Access policies
# Data source for ACI Link Level Flow Control Interface Policy
# APIC class: qosLlfcIfPol · DN: uni/infra/llfc-{name}
# Reads models/data_aci_link_level_flow_control_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_158 = yamldecode(file("${path.module}/../models/data_aci_link_level_flow_control_interface_policy.yml"))["data_aci_link_level_flow_control_interface_policy"]
}

data "aci_link_level_flow_control_interface_policy" "n158" {
  name = local.m_158["name"]
}

output "n158_data_aci_link_level_flow_control_interface_policy_id" {
  value = data.aci_link_level_flow_control_interface_policy.n158.id
}
