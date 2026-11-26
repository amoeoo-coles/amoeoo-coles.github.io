# 034 · resource sdwan_policy_object_extended_community_list · 3. Policy objects and custom applications
# This resource can manage a Policy Object Extended Community List Policy_object. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_extended_community_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_034 = yamldecode(file("${path.module}/../models/sdwan_policy_object_extended_community_list.yml"))["sdwan_policy_object_extended_community_list"]
}

resource "sdwan_policy_object_extended_community_list" "n034" {
  description        = local.m_034["description"]
  entries            = local.m_034["entries"]
  feature_profile_id = local.m_034["feature_profile_id"]
  name               = local.m_034["name"]
}
