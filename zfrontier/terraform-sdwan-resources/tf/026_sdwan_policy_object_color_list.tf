# 026 · resource sdwan_policy_object_color_list · 3. Policy objects and custom applications
# This resource can manage a Policy Object Color List Policy_object. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_color_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_026 = yamldecode(file("${path.module}/../models/sdwan_policy_object_color_list.yml"))["sdwan_policy_object_color_list"]
}

resource "sdwan_policy_object_color_list" "n026" {
  description = local.m_026["description"]
  entries = local.m_026["entries"]
  feature_profile_id = local.m_026["feature_profile_id"]
  name = local.m_026["name"]
}
