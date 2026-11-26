# 107 · data source aci_fabric_node · 1. System and fabric setup
# Data source for ACI Fabric Node
# APIC class: not collected · DN: not collected
# Reads models/data_aci_fabric_node.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_107 = yamldecode(file("${path.module}/../models/data_aci_fabric_node.yml"))["data_aci_fabric_node"]
}

data "aci_fabric_node" "n107" {
  ad_st          = local.m_107["ad_st"]
  address        = local.m_107["address"]
  annotation     = local.m_107["annotation"]
  apic_type      = local.m_107["apic_type"]
  fabric_node_id = local.m_107["fabric_node_id"]
  fabric_pod_dn  = local.m_107["fabric_pod_dn"]
  fabric_st      = local.m_107["fabric_st"]
  name           = local.m_107["name"]
  name_alias     = local.m_107["name_alias"]
  node_type      = local.m_107["node_type"]
  role           = local.m_107["role"]
}

output "n107_data_aci_fabric_node_id" {
  value = data.aci_fabric_node.n107.id
}
