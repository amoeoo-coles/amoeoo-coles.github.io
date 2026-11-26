# 368 · resource sdwan_expanded_community_list_policy_object · 10. (Classic) policy objects
# This resource can manage a Expanded Community List Policy Object .
# Reads models/sdwan_expanded_community_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_368 = yamldecode(file("${path.module}/../models/sdwan_expanded_community_list_policy_object.yml"))["sdwan_expanded_community_list_policy_object"]
}

resource "sdwan_expanded_community_list_policy_object" "n368" {
  entries = local.m_368["entries"]
  name    = local.m_368["name"]
}
