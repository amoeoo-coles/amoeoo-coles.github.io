# 192 · data source aci_copp_interface_protocol_policy · 2. Access policies
# Data source for ACI CoPP Interface Protocol Policy
# APIC class: coppProtoClassP · DN: uni/infra/coppifpol-{name}/protoclassp-{name}
# Reads models/data_aci_copp_interface_protocol_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_192 = yamldecode(file("${path.module}/../models/data_aci_copp_interface_protocol_policy.yml"))["data_aci_copp_interface_protocol_policy"]
}

data "aci_copp_interface_protocol_policy" "n192" {
  name      = local.m_192["name"]
  parent_dn = local.m_192["parent_dn"]
}

output "n192_data_aci_copp_interface_protocol_policy_id" {
  value = data.aci_copp_interface_protocol_policy.n192.id
}
