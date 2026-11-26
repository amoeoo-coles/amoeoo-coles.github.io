# 045 · resource sdwan_policy_object_preferred_color_group · 3. Policy objects and custom applications
# This resource can manage a Policy Object Preferred Color Group Policy_object. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_preferred_color_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_045 = yamldecode(file("${path.module}/../models/sdwan_policy_object_preferred_color_group.yml"))["sdwan_policy_object_preferred_color_group"]
}

resource "sdwan_policy_object_preferred_color_group" "n045" {
  description        = local.m_045["description"]
  entries            = local.m_045["entries"]
  feature_profile_id = local.m_045["feature_profile_id"]
  name               = local.m_045["name"]
}
