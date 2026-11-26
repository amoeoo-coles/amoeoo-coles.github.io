# 394 · resource sdwan_site_list_policy_object · 10. (Classic) policy objects
# This resource can manage a Site List Policy Object .
# Reads models/sdwan_site_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_394 = yamldecode(file("${path.module}/../models/sdwan_site_list_policy_object.yml"))["sdwan_site_list_policy_object"]
}

resource "sdwan_site_list_policy_object" "n394" {
  entries = local.m_394["entries"]
  name    = local.m_394["name"]
}
