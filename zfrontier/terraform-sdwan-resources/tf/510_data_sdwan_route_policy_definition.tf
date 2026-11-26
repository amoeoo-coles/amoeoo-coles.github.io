# 510 · data source sdwan_route_policy_definition · 13. (Classic) localized, centralized and security policies
# This data source can read the Route Policy Definition .
# Reads models/data_sdwan_route_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_510 = yamldecode(file("${path.module}/../models/data_sdwan_route_policy_definition.yml"))["data_sdwan_route_policy_definition"]
}

data "sdwan_route_policy_definition" "n510" {
  id = local.m_510["id"]
}

output "n510_data_sdwan_route_policy_definition_id" {
  value = data.sdwan_route_policy_definition.n510.id
}
