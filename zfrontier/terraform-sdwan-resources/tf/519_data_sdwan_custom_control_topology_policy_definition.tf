# 519 · data source sdwan_custom_control_topology_policy_definition · 13. (Classic) localized, centralized and security policies
# This data source can read the Custom Control Topology Policy Definition .
# Reads models/data_sdwan_custom_control_topology_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_519 = yamldecode(file("${path.module}/../models/data_sdwan_custom_control_topology_policy_definition.yml"))["data_sdwan_custom_control_topology_policy_definition"]
}

data "sdwan_custom_control_topology_policy_definition" "n519" {
  id = local.m_519["id"]
}

output "n519_data_sdwan_custom_control_topology_policy_definition_id" {
  value = data.sdwan_custom_control_topology_policy_definition.n519.id
}
