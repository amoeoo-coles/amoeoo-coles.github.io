# 521 · data source sdwan_hub_and_spoke_topology_policy_definition · 13. (Classic) localized, centralized and security policies
# This data source can read the Hub and Spoke Topology Policy Definition .
# Reads models/data_sdwan_hub_and_spoke_topology_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_521 = yamldecode(file("${path.module}/../models/data_sdwan_hub_and_spoke_topology_policy_definition.yml"))["data_sdwan_hub_and_spoke_topology_policy_definition"]
}

data "sdwan_hub_and_spoke_topology_policy_definition" "n521" {
  id = local.m_521["id"]
}

output "n521_data_sdwan_hub_and_spoke_topology_policy_definition_id" {
  value = data.sdwan_hub_and_spoke_topology_policy_definition.n521.id
}
