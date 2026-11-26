# 335 · data source sdwan_application_priority_policy_settings_policy · 9. Configuration, policy and topology groups
# This data source can read the Application Priority Policy Settings Policy.
# Reads models/data_sdwan_application_priority_policy_settings_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_335 = yamldecode(file("${path.module}/../models/data_sdwan_application_priority_policy_settings_policy.yml"))["data_sdwan_application_priority_policy_settings_policy"]
}

data "sdwan_application_priority_policy_settings_policy" "n335" {
  feature_profile_id = local.m_335["feature_profile_id"]
  id = local.m_335["id"]
}

output "n335_data_sdwan_application_priority_policy_settings_policy_id" {
  value = data.sdwan_application_priority_policy_settings_policy.n335.id
}
