# 349 · data source sdwan_app_probe_class_policy_object · 10. (Classic) policy objects
# This data source can read the App Probe Class Policy Object .
# Reads models/data_sdwan_app_probe_class_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_349 = yamldecode(file("${path.module}/../models/data_sdwan_app_probe_class_policy_object.yml"))["data_sdwan_app_probe_class_policy_object"]
}

data "sdwan_app_probe_class_policy_object" "n349" {
  id = local.m_349["id"]
}

output "n349_data_sdwan_app_probe_class_policy_object_id" {
  value = data.sdwan_app_probe_class_policy_object.n349.id
}
