# 613 · data source aci_concrete_interface · 5. L4-L7 service graphs
# Data source for ACI Concrete Interface
# APIC class: not collected · DN: not collected
# Reads models/data_aci_concrete_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_613 = yamldecode(file("${path.module}/../models/data_aci_concrete_interface.yml"))["data_aci_concrete_interface"]
}

data "aci_concrete_interface" "n613" {
  annotation                    = local.m_613["annotation"]
  concrete_device_dn            = local.m_613["concrete_device_dn"]
  description                   = local.m_613["description"]
  encap                         = local.m_613["encap"]
  name                          = local.m_613["name"]
  name_alias                    = local.m_613["name_alias"]
  relation_vns_rs_c_if_path_att = local.m_613["relation_vns_rs_c_if_path_att"]
  vnic_name                     = local.m_613["vnic_name"]
}

output "n613_data_aci_concrete_interface_id" {
  value = data.aci_concrete_interface.n613.id
}
