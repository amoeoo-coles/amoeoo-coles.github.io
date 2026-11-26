# 080 · data source sdwan_policy_object_security_zone · 3. Policy objects and custom applications
# This data source can read the Policy Object Security Zone Policy_object.
# Reads models/data_sdwan_policy_object_security_zone.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_080 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_security_zone.yml"))["data_sdwan_policy_object_security_zone"]
}

data "sdwan_policy_object_security_zone" "n080" {
  feature_profile_id = local.m_080["feature_profile_id"]
  id                 = local.m_080["id"]
  name               = local.m_080["name"]
}

output "n080_data_sdwan_policy_object_security_zone_id" {
  value = data.sdwan_policy_object_security_zone.n080.id
}
