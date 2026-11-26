# 525 · data source sdwan_traffic_data_policy_definition · 13. (Classic) localized, centralized and security policies
# This data source can read the Traffic Data Policy Definition .
# Reads models/data_sdwan_traffic_data_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_525 = yamldecode(file("${path.module}/../models/data_sdwan_traffic_data_policy_definition.yml"))["data_sdwan_traffic_data_policy_definition"]
}

data "sdwan_traffic_data_policy_definition" "n525" {
  id = local.m_525["id"]
}

output "n525_data_sdwan_traffic_data_policy_definition_id" {
  value = data.sdwan_traffic_data_policy_definition.n525.id
}
