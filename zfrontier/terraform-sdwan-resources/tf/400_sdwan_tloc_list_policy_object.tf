# 400 · resource sdwan_tloc_list_policy_object · 10. (Classic) policy objects
# This resource can manage a TLOC List Policy Object .
# Reads models/sdwan_tloc_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_400 = yamldecode(file("${path.module}/../models/sdwan_tloc_list_policy_object.yml"))["sdwan_tloc_list_policy_object"]
}

resource "sdwan_tloc_list_policy_object" "n400" {
  entries = local.m_400["entries"]
  name    = local.m_400["name"]
}
