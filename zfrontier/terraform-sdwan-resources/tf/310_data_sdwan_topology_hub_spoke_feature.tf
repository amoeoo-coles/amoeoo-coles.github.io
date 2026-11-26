# 310 · data source sdwan_topology_hub_spoke_feature · 8. Features: CLI, topology, SIG, SSE and other
# This data source can read the Topology Hub Spoke Feature.
# Reads models/data_sdwan_topology_hub_spoke_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_310 = yamldecode(file("${path.module}/../models/data_sdwan_topology_hub_spoke_feature.yml"))["data_sdwan_topology_hub_spoke_feature"]
}

data "sdwan_topology_hub_spoke_feature" "n310" {
  feature_profile_id = local.m_310["feature_profile_id"]
  id                 = local.m_310["id"]
}

output "n310_data_sdwan_topology_hub_spoke_feature_id" {
  value = data.sdwan_topology_hub_spoke_feature.n310.id
}
