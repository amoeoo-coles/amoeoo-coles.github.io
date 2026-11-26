# 607 · data source aci_l4_l7_logical_interface · 5. L4-L7 service graphs
# Data source for ACI L4-L7 Logical Interface
# APIC class: not collected · DN: not collected
# Reads models/data_aci_l4_l7_logical_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_607 = yamldecode(file("${path.module}/../models/data_aci_l4_l7_logical_interface.yml"))["data_aci_l4_l7_logical_interface"]
}

data "aci_l4_l7_logical_interface" "n607" {
  annotation                 = local.m_607["annotation"]
  description                = local.m_607["description"]
  encap                      = local.m_607["encap"]
  enhanced_lag_policy_name   = local.m_607["enhanced_lag_policy_name"]
  l4_l7_device_dn            = local.m_607["l4_l7_device_dn"]
  name                       = local.m_607["name"]
  name_alias                 = local.m_607["name_alias"]
  relation_vns_rs_c_if_att_n = local.m_607["relation_vns_rs_c_if_att_n"]
}

output "n607_data_aci_l4_l7_logical_interface_id" {
  value = data.aci_l4_l7_logical_interface.n607.id
}
