# 337 · data source sdwan_application_priority_qos_policy · 9. Configuration, policy and topology groups
# This data source can read the Application Priority QoS Policy.
# Reads models/data_sdwan_application_priority_qos_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_337 = yamldecode(file("${path.module}/../models/data_sdwan_application_priority_qos_policy.yml"))["data_sdwan_application_priority_qos_policy"]
}

data "sdwan_application_priority_qos_policy" "n337" {
  feature_profile_id = local.m_337["feature_profile_id"]
  id                 = local.m_337["id"]
}

output "n337_data_sdwan_application_priority_qos_policy_id" {
  value = data.sdwan_application_priority_qos_policy.n337.id
}
