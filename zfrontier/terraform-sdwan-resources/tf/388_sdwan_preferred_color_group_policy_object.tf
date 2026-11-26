# 388 · resource sdwan_preferred_color_group_policy_object · 10. (Classic) policy objects
# This resource can manage a Preferred Color Group Policy Object .
# Reads models/sdwan_preferred_color_group_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_388 = yamldecode(file("${path.module}/../models/sdwan_preferred_color_group_policy_object.yml"))["sdwan_preferred_color_group_policy_object"]
}

resource "sdwan_preferred_color_group_policy_object" "n388" {
  name                       = local.m_388["name"]
  primary_color_preference   = local.m_388["primary_color_preference"]
  primary_path_preference    = local.m_388["primary_path_preference"]
  secondary_color_preference = local.m_388["secondary_color_preference"]
  secondary_path_preference  = local.m_388["secondary_path_preference"]
  tertiary_color_preference  = local.m_388["tertiary_color_preference"]
  tertiary_path_preference   = local.m_388["tertiary_path_preference"]
}
