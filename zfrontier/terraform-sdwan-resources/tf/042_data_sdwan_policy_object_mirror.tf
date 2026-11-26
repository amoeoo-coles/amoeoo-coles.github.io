# 042 · data source sdwan_policy_object_mirror · 3. Policy objects and custom applications
# This data source can read the Policy Object Mirror Policy_object.
# Reads models/data_sdwan_policy_object_mirror.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_042 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_mirror.yml"))["data_sdwan_policy_object_mirror"]
}

data "sdwan_policy_object_mirror" "n042" {
  feature_profile_id = local.m_042["feature_profile_id"]
  id = local.m_042["id"]
  name = local.m_042["name"]
}

output "n042_data_sdwan_policy_object_mirror_id" {
  value = data.sdwan_policy_object_mirror.n042.id
}
