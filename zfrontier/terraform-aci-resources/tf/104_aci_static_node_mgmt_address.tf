# 104 · resource aci_static_node_mgmt_address · 1. System and fabric setup
# Manages ACI Management Static Node
# APIC class: not collected · DN: not collected
# Reads models/aci_static_node_mgmt_address.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_104 = yamldecode(file("${path.module}/../models/aci_static_node_mgmt_address.yml"))["aci_static_node_mgmt_address"]
}

resource "aci_static_node_mgmt_address" "n104" {
  addr              = local.m_104["addr"]
  annotation        = local.m_104["annotation"]
  description       = local.m_104["description"]
  gw                = local.m_104["gw"]
  management_epg_dn = local.m_104["management_epg_dn"]
  t_dn              = local.m_104["t_dn"]
  type              = local.m_104["type"]
  v6_addr           = local.m_104["v6_addr"]
  v6_gw             = local.m_104["v6_gw"]
}
