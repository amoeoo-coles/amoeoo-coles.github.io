# 109 · data source aci_fabric_node_member · 1. System and fabric setup
# Data source for ACI Fabric Node Member
# APIC class: fabricNodeIdentP · DN: not collected
# Reads models/data_aci_fabric_node_member.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_109 = yamldecode(file("${path.module}/../models/data_aci_fabric_node_member.yml"))["data_aci_fabric_node_member"]
}

data "aci_fabric_node_member" "n109" {
  annotation  = local.m_109["annotation"]
  description = local.m_109["description"]
  ext_pool_id = local.m_109["ext_pool_id"]
  fabric_id   = local.m_109["fabric_id"]
  name_alias  = local.m_109["name_alias"]
  node_id     = local.m_109["node_id"]
  node_type   = local.m_109["node_type"]
  pod_id      = local.m_109["pod_id"]
  role        = local.m_109["role"]
  serial      = local.m_109["serial"]
}

output "n109_data_aci_fabric_node_member_id" {
  value = data.aci_fabric_node_member.n109.id
}
