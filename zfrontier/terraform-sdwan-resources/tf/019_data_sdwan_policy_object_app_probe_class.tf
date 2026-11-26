# 019 · data source sdwan_policy_object_app_probe_class · 3. Policy objects and custom applications
# This data source can read the Policy Object App Probe Class Policy_object.
# Reads models/data_sdwan_policy_object_app_probe_class.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_019 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_app_probe_class.yml"))["data_sdwan_policy_object_app_probe_class"]
}

data "sdwan_policy_object_app_probe_class" "n019" {
  feature_profile_id = local.m_019["feature_profile_id"]
  id = local.m_019["id"]
  name = local.m_019["name"]
}

output "n019_data_sdwan_policy_object_app_probe_class_id" {
  value = data.sdwan_policy_object_app_probe_class.n019.id
}
