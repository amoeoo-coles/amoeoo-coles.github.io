# 044 · data source sdwan_policy_object_policer · 3. Policy objects and custom applications
# This data source can read the Policy Object Policer Policy_object.
# Reads models/data_sdwan_policy_object_policer.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_044 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_policer.yml"))["data_sdwan_policy_object_policer"]
}

data "sdwan_policy_object_policer" "n044" {
  feature_profile_id = local.m_044["feature_profile_id"]
  id                 = local.m_044["id"]
  name               = local.m_044["name"]
}

output "n044_data_sdwan_policy_object_policer_id" {
  value = data.sdwan_policy_object_policer.n044.id
}
