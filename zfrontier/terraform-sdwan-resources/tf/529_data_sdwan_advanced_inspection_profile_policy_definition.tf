# 529 · data source sdwan_advanced_inspection_profile_policy_definition · 13. (Classic) localized, centralized and security policies
# This data source can read the Advanced Inspection Profile Policy Definition .
# Reads models/data_sdwan_advanced_inspection_profile_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_529 = yamldecode(file("${path.module}/../models/data_sdwan_advanced_inspection_profile_policy_definition.yml"))["data_sdwan_advanced_inspection_profile_policy_definition"]
}

data "sdwan_advanced_inspection_profile_policy_definition" "n529" {
  id = local.m_529["id"]
}

output "n529_data_sdwan_advanced_inspection_profile_policy_definition_id" {
  value = data.sdwan_advanced_inspection_profile_policy_definition.n529.id
}
