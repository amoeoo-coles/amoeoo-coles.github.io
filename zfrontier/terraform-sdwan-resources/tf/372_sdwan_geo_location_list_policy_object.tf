# 372 · resource sdwan_geo_location_list_policy_object · 10. (Classic) policy objects
# This resource can manage a Geo Location List Policy Object .
# Reads models/sdwan_geo_location_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_372 = yamldecode(file("${path.module}/../models/sdwan_geo_location_list_policy_object.yml"))["sdwan_geo_location_list_policy_object"]
}

resource "sdwan_geo_location_list_policy_object" "n372" {
  entries = local.m_372["entries"]
  name    = local.m_372["name"]
}
