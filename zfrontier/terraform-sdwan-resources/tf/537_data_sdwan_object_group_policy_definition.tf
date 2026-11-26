# 537 · data source sdwan_object_group_policy_definition · 13. (Classic) localized, centralized and security policies
# This data source can read the Object Group Policy Definition .
# Reads models/data_sdwan_object_group_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_537 = yamldecode(file("${path.module}/../models/data_sdwan_object_group_policy_definition.yml"))["data_sdwan_object_group_policy_definition"]
}

data "sdwan_object_group_policy_definition" "n537" {
  id = local.m_537["id"]
}

output "n537_data_sdwan_object_group_policy_definition_id" {
  value = data.sdwan_object_group_policy_definition.n537.id
}
