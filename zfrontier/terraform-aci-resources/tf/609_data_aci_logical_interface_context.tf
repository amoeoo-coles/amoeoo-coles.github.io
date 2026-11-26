# 609 · data source aci_logical_interface_context · 5. L4-L7 service graphs
# Data source for ACI Logical Interface Context
# APIC class: not collected · DN: not collected
# Reads models/data_aci_logical_interface_context.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_609 = yamldecode(file("${path.module}/../models/data_aci_logical_interface_context.yml"))["data_aci_logical_interface_context"]
}

data "aci_logical_interface_context" "n609" {
  annotation                = local.m_609["annotation"]
  conn_name_or_lbl          = local.m_609["conn_name_or_lbl"]
  description               = local.m_609["description"]
  l3_dest                   = local.m_609["l3_dest"]
  logical_device_context_dn = local.m_609["logical_device_context_dn"]
  name_alias                = local.m_609["name_alias"]
  permit_log                = local.m_609["permit_log"]
}

output "n609_data_aci_logical_interface_context_id" {
  value = data.aci_logical_interface_context.n609.id
}
