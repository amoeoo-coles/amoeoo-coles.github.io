# 092 · data source sdwan_policy_object_unified_intrusion_prevention · 3. Policy objects and custom applications
# This data source can read the Policy Object Unified Intrusion Prevention Policy_object.
# Reads models/data_sdwan_policy_object_unified_intrusion_prevention.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_092 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_unified_intrusion_prevention.yml"))["data_sdwan_policy_object_unified_intrusion_prevention"]
}

data "sdwan_policy_object_unified_intrusion_prevention" "n092" {
  feature_profile_id = local.m_092["feature_profile_id"]
  id = local.m_092["id"]
  name = local.m_092["name"]
}

output "n092_data_sdwan_policy_object_unified_intrusion_prevention_id" {
  value = data.sdwan_policy_object_unified_intrusion_prevention.n092.id
}
