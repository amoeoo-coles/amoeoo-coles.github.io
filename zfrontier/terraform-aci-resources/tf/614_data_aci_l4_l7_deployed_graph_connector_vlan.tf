# 614 · data source aci_l4_l7_deployed_graph_connector_vlan · 5. L4-L7 service graphs
# Data Source for ACI L4-L7 Deployed Graph Connector VLAN
# APIC class: not collected · DN: not collected
# Reads models/data_aci_l4_l7_deployed_graph_connector_vlan.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_614 = yamldecode(file("${path.module}/../models/data_aci_l4_l7_deployed_graph_connector_vlan.yml"))["data_aci_l4_l7_deployed_graph_connector_vlan"]
}

data "aci_l4_l7_deployed_graph_connector_vlan" "n614" {
  annotation          = local.m_614["annotation"]
  delete_pbr_scenario = local.m_614["delete_pbr_scenario"]
  description         = local.m_614["description"]
  encap               = local.m_614["encap"]
  fabric_encap        = local.m_614["fabric_encap"]
  logical_context_dn  = local.m_614["logical_context_dn"]
  member_type         = local.m_614["member_type"]
  name                = local.m_614["name"]
  name_alias          = local.m_614["name_alias"]
  router_id           = local.m_614["router_id"]
}

output "n614_data_aci_l4_l7_deployed_graph_connector_vlan_id" {
  value = data.aci_l4_l7_deployed_graph_connector_vlan.n614.id
}
