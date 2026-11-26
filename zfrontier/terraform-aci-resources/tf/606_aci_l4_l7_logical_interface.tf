# 606 · resource aci_l4_l7_logical_interface · 5. L4-L7 service graphs
# Manages ACI L4-L7 Logical Interface
# APIC class: not collected · DN: not collected
# Reads models/aci_l4_l7_logical_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_606 = yamldecode(file("${path.module}/../models/aci_l4_l7_logical_interface.yml"))["aci_l4_l7_logical_interface"]
}

resource "aci_l4_l7_logical_interface" "n606" {
  annotation                 = local.m_606["annotation"]
  description                = local.m_606["description"]
  encap                      = local.m_606["encap"]
  enhanced_lag_policy_name   = local.m_606["enhanced_lag_policy_name"]
  l4_l7_device_dn            = local.m_606["l4_l7_device_dn"]
  name                       = local.m_606["name"]
  name_alias                 = local.m_606["name_alias"]
  relation_vns_rs_c_if_att_n = local.m_606["relation_vns_rs_c_if_att_n"]
}
