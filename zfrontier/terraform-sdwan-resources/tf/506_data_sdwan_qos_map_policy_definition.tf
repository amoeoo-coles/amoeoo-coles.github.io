# 506 · data source sdwan_qos_map_policy_definition · 13. (Classic) localized, centralized and security policies
# This data source can read the QoS Map Policy Definition .
# Reads models/data_sdwan_qos_map_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_506 = yamldecode(file("${path.module}/../models/data_sdwan_qos_map_policy_definition.yml"))["data_sdwan_qos_map_policy_definition"]
}

data "sdwan_qos_map_policy_definition" "n506" {
  id = local.m_506["id"]
}

output "n506_data_sdwan_qos_map_policy_definition_id" {
  value = data.sdwan_qos_map_policy_definition.n506.id
}
