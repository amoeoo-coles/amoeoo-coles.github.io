# 398 · resource sdwan_standard_community_list_policy_object · 10. (Classic) policy objects
# This resource can manage a Standard Community List Policy Object .
# Reads models/sdwan_standard_community_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_398 = yamldecode(file("${path.module}/../models/sdwan_standard_community_list_policy_object.yml"))["sdwan_standard_community_list_policy_object"]
}

resource "sdwan_standard_community_list_policy_object" "n398" {
  entries = local.m_398["entries"]
  name    = local.m_398["name"]
}
