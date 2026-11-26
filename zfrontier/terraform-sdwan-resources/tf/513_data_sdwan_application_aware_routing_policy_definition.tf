# 513 · data source sdwan_application_aware_routing_policy_definition · 13. (Classic) localized, centralized and security policies
# This data source can read the Application Aware Routing Policy Definition .
# Reads models/data_sdwan_application_aware_routing_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_513 = yamldecode(file("${path.module}/../models/data_sdwan_application_aware_routing_policy_definition.yml"))["data_sdwan_application_aware_routing_policy_definition"]
}

data "sdwan_application_aware_routing_policy_definition" "n513" {
  id = local.m_513["id"]
}

output "n513_data_sdwan_application_aware_routing_policy_definition_id" {
  value = data.sdwan_application_aware_routing_policy_definition.n513.id
}
