# 024 · resource sdwan_policy_object_class_map · 3. Policy objects and custom applications
# This resource can manage a Policy Object Class Map Policy_object. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_class_map.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_024 = yamldecode(file("${path.module}/../models/sdwan_policy_object_class_map.yml"))["sdwan_policy_object_class_map"]
}

resource "sdwan_policy_object_class_map" "n024" {
  description = local.m_024["description"]
  entries = local.m_024["entries"]
  feature_profile_id = local.m_024["feature_profile_id"]
  name = local.m_024["name"]
}
