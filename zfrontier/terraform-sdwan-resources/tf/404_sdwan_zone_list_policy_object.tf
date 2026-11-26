# 404 · resource sdwan_zone_list_policy_object · 10. (Classic) policy objects
# This resource can manage a Zone List Policy Object .
# Reads models/sdwan_zone_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_404 = yamldecode(file("${path.module}/../models/sdwan_zone_list_policy_object.yml"))["sdwan_zone_list_policy_object"]
}

resource "sdwan_zone_list_policy_object" "n404" {
  entries = local.m_404["entries"]
  name    = local.m_404["name"]
}
