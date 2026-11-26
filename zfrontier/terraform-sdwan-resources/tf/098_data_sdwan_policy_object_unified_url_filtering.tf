# 098 · data source sdwan_policy_object_unified_url_filtering · 3. Policy objects and custom applications
# This data source can read the Policy Object Unified URL Filtering Policy_object.
# Reads models/data_sdwan_policy_object_unified_url_filtering.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_098 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_unified_url_filtering.yml"))["data_sdwan_policy_object_unified_url_filtering"]
}

data "sdwan_policy_object_unified_url_filtering" "n098" {
  feature_profile_id = local.m_098["feature_profile_id"]
  id                 = local.m_098["id"]
  name               = local.m_098["name"]
}

output "n098_data_sdwan_policy_object_unified_url_filtering_id" {
  value = data.sdwan_policy_object_unified_url_filtering.n098.id
}
