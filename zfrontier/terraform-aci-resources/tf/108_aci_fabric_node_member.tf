# 108 · resource aci_fabric_node_member · 1. System and fabric setup
# Manages ACI Fabric Node Member
# APIC class: fabricNodeIdentP · DN: not collected
# Reads models/aci_fabric_node_member.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_108 = yamldecode(file("${path.module}/../models/aci_fabric_node_member.yml"))["aci_fabric_node_member"]
}

resource "aci_fabric_node_member" "n108" {
  annotation  = local.m_108["annotation"]
  commission  = local.m_108["commission"]
  description = local.m_108["description"]
  ext_pool_id = local.m_108["ext_pool_id"]
  fabric_id   = local.m_108["fabric_id"]
  name        = local.m_108["name"]
  name_alias  = local.m_108["name_alias"]
  node_id     = local.m_108["node_id"]
  node_type   = local.m_108["node_type"]
  pod_id      = local.m_108["pod_id"]
  role        = local.m_108["role"]
  serial      = local.m_108["serial"]
}
