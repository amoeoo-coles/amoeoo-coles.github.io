# 339 · data source sdwan_application_priority_traffic_policy_policy · 9. Configuration, policy and topology groups
# This data source can read the Application Priority Traffic Policy Policy.
# Reads models/data_sdwan_application_priority_traffic_policy_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_339 = yamldecode(file("${path.module}/../models/data_sdwan_application_priority_traffic_policy_policy.yml"))["data_sdwan_application_priority_traffic_policy_policy"]
}

data "sdwan_application_priority_traffic_policy_policy" "n339" {
  feature_profile_id = local.m_339["feature_profile_id"]
  id = local.m_339["id"]
}

output "n339_data_sdwan_application_priority_traffic_policy_policy_id" {
  value = data.sdwan_application_priority_traffic_policy_policy.n339.id
}
