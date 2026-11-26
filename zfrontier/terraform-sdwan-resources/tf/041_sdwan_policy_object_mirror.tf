# 041 · resource sdwan_policy_object_mirror · 3. Policy objects and custom applications
# This resource can manage a Policy Object Mirror Policy_object. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_mirror.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_041 = yamldecode(file("${path.module}/../models/sdwan_policy_object_mirror.yml"))["sdwan_policy_object_mirror"]
}

resource "sdwan_policy_object_mirror" "n041" {
  description = local.m_041["description"]
  entries = local.m_041["entries"]
  feature_profile_id = local.m_041["feature_profile_id"]
  name = local.m_041["name"]
}
