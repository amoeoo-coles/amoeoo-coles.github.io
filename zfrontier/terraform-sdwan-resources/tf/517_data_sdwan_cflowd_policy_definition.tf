# 517 · data source sdwan_cflowd_policy_definition · 13. (Classic) localized, centralized and security policies
# This data source can read the Cflowd Policy Definition .
# Reads models/data_sdwan_cflowd_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_517 = yamldecode(file("${path.module}/../models/data_sdwan_cflowd_policy_definition.yml"))["data_sdwan_cflowd_policy_definition"]
}

data "sdwan_cflowd_policy_definition" "n517" {
  id = local.m_517["id"]
}

output "n517_data_sdwan_cflowd_policy_definition_id" {
  value = data.sdwan_cflowd_policy_definition.n517.id
}
