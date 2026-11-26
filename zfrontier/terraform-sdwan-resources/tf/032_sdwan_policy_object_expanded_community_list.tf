# 032 · resource sdwan_policy_object_expanded_community_list · 3. Policy objects and custom applications
# This resource can manage a Policy Object Expanded Community List Policy_object. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_expanded_community_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_032 = yamldecode(file("${path.module}/../models/sdwan_policy_object_expanded_community_list.yml"))["sdwan_policy_object_expanded_community_list"]
}

resource "sdwan_policy_object_expanded_community_list" "n032" {
  description = local.m_032["description"]
  expanded_community_lists = local.m_032["expanded_community_lists"]
  expanded_community_lists_variable = local.m_032["expanded_community_lists_variable"]
  feature_profile_id = local.m_032["feature_profile_id"]
  name = local.m_032["name"]
}
