# 083 · resource sdwan_policy_object_standard_community_list · 3. Policy objects and custom applications
# This resource can manage a Policy Object Standard Community List Policy_object. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_standard_community_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_083 = yamldecode(file("${path.module}/../models/sdwan_policy_object_standard_community_list.yml"))["sdwan_policy_object_standard_community_list"]
}

resource "sdwan_policy_object_standard_community_list" "n083" {
  description        = local.m_083["description"]
  entries            = local.m_083["entries"]
  feature_profile_id = local.m_083["feature_profile_id"]
  name               = local.m_083["name"]
}
