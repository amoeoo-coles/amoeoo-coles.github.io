# 105 · data source aci_static_node_mgmt_address · 1. System and fabric setup
# Data source for ACI Management Static Node
# APIC class: not collected · DN: not collected
# Reads models/data_aci_static_node_mgmt_address.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_105 = yamldecode(file("${path.module}/../models/data_aci_static_node_mgmt_address.yml"))["data_aci_static_node_mgmt_address"]
}

data "aci_static_node_mgmt_address" "n105" {
  addr              = local.m_105["addr"]
  annotation        = local.m_105["annotation"]
  description       = local.m_105["description"]
  gw                = local.m_105["gw"]
  management_epg_dn = local.m_105["management_epg_dn"]
  t_dn              = local.m_105["t_dn"]
  type              = local.m_105["type"]
  v6_addr           = local.m_105["v6_addr"]
  v6_gw             = local.m_105["v6_gw"]
}

output "n105_data_aci_static_node_mgmt_address_id" {
  value = data.aci_static_node_mgmt_address.n105.id
}
