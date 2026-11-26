# 593 · data source aci_logical_device_context · 5. L4-L7 service graphs
# Data source for ACI Logical Device Context
# APIC class: not collected · DN: not collected
# Reads models/data_aci_logical_device_context.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_593 = yamldecode(file("${path.module}/../models/data_aci_logical_device_context.yml"))["data_aci_logical_device_context"]
}

data "aci_logical_device_context" "n593" {
  annotation        = local.m_593["annotation"]
  context           = local.m_593["context"]
  ctrct_name_or_lbl = local.m_593["ctrct_name_or_lbl"]
  description       = local.m_593["description"]
  graph_name_or_lbl = local.m_593["graph_name_or_lbl"]
  name_alias        = local.m_593["name_alias"]
  node_name_or_lbl  = local.m_593["node_name_or_lbl"]
  tenant_dn         = local.m_593["tenant_dn"]
}

output "n593_data_aci_logical_device_context_id" {
  value = data.aci_logical_device_context.n593.id
}
