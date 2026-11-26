# 370 · resource sdwan_extended_community_list_policy_object · 10. (Classic) policy objects
# This resource can manage a Extended Community List Policy Object .
# Reads models/sdwan_extended_community_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_370 = yamldecode(file("${path.module}/../models/sdwan_extended_community_list_policy_object.yml"))["sdwan_extended_community_list_policy_object"]
}

resource "sdwan_extended_community_list_policy_object" "n370" {
  entries = local.m_370["entries"]
  name    = local.m_370["name"]
}
