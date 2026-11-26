# 504 · data source sdwan_localized_policy · 13. (Classic) localized, centralized and security policies
# This data source can read the Localized Policy .
# Reads models/data_sdwan_localized_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_504 = yamldecode(file("${path.module}/../models/data_sdwan_localized_policy.yml"))["data_sdwan_localized_policy"]
}

data "sdwan_localized_policy" "n504" {
  id = local.m_504["id"]
}

output "n504_data_sdwan_localized_policy_id" {
  value = data.sdwan_localized_policy.n504.id
}
