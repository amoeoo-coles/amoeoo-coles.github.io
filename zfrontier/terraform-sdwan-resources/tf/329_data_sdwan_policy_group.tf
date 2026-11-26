# 329 · data source sdwan_policy_group · 9. Configuration, policy and topology groups
# This data source can read the Policy Group .
# Reads models/data_sdwan_policy_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_329 = yamldecode(file("${path.module}/../models/data_sdwan_policy_group.yml"))["data_sdwan_policy_group"]
}

data "sdwan_policy_group" "n329" {
  id   = local.m_329["id"]
  name = local.m_329["name"]
}

output "n329_data_sdwan_policy_group_id" {
  value = data.sdwan_policy_group.n329.id
}
