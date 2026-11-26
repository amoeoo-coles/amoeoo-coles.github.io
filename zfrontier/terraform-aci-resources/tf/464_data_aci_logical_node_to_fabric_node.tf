# 464 · data source aci_logical_node_to_fabric_node · 3. Tenant and networking
# Data source for ACI Logical Node to Fabric Node
# APIC class: not collected · DN: not collected
# Reads models/data_aci_logical_node_to_fabric_node.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_464 = yamldecode(file("${path.module}/../models/data_aci_logical_node_to_fabric_node.yml"))["data_aci_logical_node_to_fabric_node"]
}

data "aci_logical_node_to_fabric_node" "n464" {
  annotation              = local.m_464["annotation"]
  config_issues           = local.m_464["config_issues"]
  description             = local.m_464["description"]
  logical_node_profile_dn = local.m_464["logical_node_profile_dn"]
  rtr_id                  = local.m_464["rtr_id"]
  rtr_id_loop_back        = local.m_464["rtr_id_loop_back"]
  tdn                     = local.m_464["tdn"]
}

output "n464_data_aci_logical_node_to_fabric_node_id" {
  value = data.aci_logical_node_to_fabric_node.n464.id
}
