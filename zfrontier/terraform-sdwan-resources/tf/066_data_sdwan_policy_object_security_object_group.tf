# 066 · data source sdwan_policy_object_security_object_group · 3. Policy objects and custom applications
# This data source can read the Policy Object Security Object Group Policy_object.
# Reads models/data_sdwan_policy_object_security_object_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_066 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_security_object_group.yml"))["data_sdwan_policy_object_security_object_group"]
}

data "sdwan_policy_object_security_object_group" "n066" {
  feature_profile_id = local.m_066["feature_profile_id"]
  id                 = local.m_066["id"]
  name               = local.m_066["name"]
}

output "n066_data_sdwan_policy_object_security_object_group_id" {
  value = data.sdwan_policy_object_security_object_group.n066.id
}
