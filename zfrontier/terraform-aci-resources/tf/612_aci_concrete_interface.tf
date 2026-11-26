# 612 · resource aci_concrete_interface · 5. L4-L7 service graphs
# Manages ACI Concrete Interface
# APIC class: not collected · DN: not collected
# Reads models/aci_concrete_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_612 = yamldecode(file("${path.module}/../models/aci_concrete_interface.yml"))["aci_concrete_interface"]
}

resource "aci_concrete_interface" "n612" {
  annotation                    = local.m_612["annotation"]
  concrete_device_dn            = local.m_612["concrete_device_dn"]
  description                   = local.m_612["description"]
  encap                         = local.m_612["encap"]
  name                          = local.m_612["name"]
  name_alias                    = local.m_612["name_alias"]
  relation_vns_rs_c_if_path_att = local.m_612["relation_vns_rs_c_if_path_att"]
  vnic_name                     = local.m_612["vnic_name"]
}
