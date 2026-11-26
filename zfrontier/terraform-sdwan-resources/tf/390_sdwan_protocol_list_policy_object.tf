# 390 · resource sdwan_protocol_list_policy_object · 10. (Classic) policy objects
# This resource can manage a Protocol List Policy Object .
# Reads models/sdwan_protocol_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_390 = yamldecode(file("${path.module}/../models/sdwan_protocol_list_policy_object.yml"))["sdwan_protocol_list_policy_object"]
}

resource "sdwan_protocol_list_policy_object" "n390" {
  entries = local.m_390["entries"]
  name    = local.m_390["name"]
}
