# 358 · resource sdwan_color_list_policy_object · 10. (Classic) policy objects
# This resource can manage a Color List Policy Object .
# Reads models/sdwan_color_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_358 = yamldecode(file("${path.module}/../models/sdwan_color_list_policy_object.yml"))["sdwan_color_list_policy_object"]
}

resource "sdwan_color_list_policy_object" "n358" {
  entries = local.m_358["entries"]
  name    = local.m_358["name"]
}
