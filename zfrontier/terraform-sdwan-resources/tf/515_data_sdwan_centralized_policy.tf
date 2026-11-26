# 515 · data source sdwan_centralized_policy · 13. (Classic) localized, centralized and security policies
# This data source can read the Centralized Policy .
# Reads models/data_sdwan_centralized_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_515 = yamldecode(file("${path.module}/../models/data_sdwan_centralized_policy.yml"))["data_sdwan_centralized_policy"]
}

data "sdwan_centralized_policy" "n515" {
  id = local.m_515["id"]
}

output "n515_data_sdwan_centralized_policy_id" {
  value = data.sdwan_centralized_policy.n515.id
}
