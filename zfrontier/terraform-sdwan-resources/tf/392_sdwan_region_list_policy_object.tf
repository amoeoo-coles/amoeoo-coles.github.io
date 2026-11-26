# 392 · resource sdwan_region_list_policy_object · 10. (Classic) policy objects
# This resource can manage a Region List Policy Object .
# Reads models/sdwan_region_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_392 = yamldecode(file("${path.module}/../models/sdwan_region_list_policy_object.yml"))["sdwan_region_list_policy_object"]
}

resource "sdwan_region_list_policy_object" "n392" {
  entries = local.m_392["entries"]
  name = local.m_392["name"]
}
