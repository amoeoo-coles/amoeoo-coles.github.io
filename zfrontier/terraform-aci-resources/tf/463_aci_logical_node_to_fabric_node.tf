# 463 · resource aci_logical_node_to_fabric_node · 3. Tenant and networking
# Manages ACI Logical Node to Fabric Node
# APIC class: not collected · DN: not collected
# Reads models/aci_logical_node_to_fabric_node.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_463 = yamldecode(file("${path.module}/../models/aci_logical_node_to_fabric_node.yml"))["aci_logical_node_to_fabric_node"]
}

resource "aci_logical_node_to_fabric_node" "n463" {
  annotation              = local.m_463["annotation"]
  config_issues           = local.m_463["config_issues"]
  description             = local.m_463["description"]
  logical_node_profile_dn = local.m_463["logical_node_profile_dn"]
  rtr_id                  = local.m_463["rtr_id"]
  rtr_id_loop_back        = local.m_463["rtr_id_loop_back"]
  tdn                     = local.m_463["tdn"]
}
