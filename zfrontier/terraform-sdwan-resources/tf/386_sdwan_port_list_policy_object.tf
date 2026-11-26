# 386 · resource sdwan_port_list_policy_object · 10. (Classic) policy objects
# This resource can manage a Port List Policy Object .
# Reads models/sdwan_port_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_386 = yamldecode(file("${path.module}/../models/sdwan_port_list_policy_object.yml"))["sdwan_port_list_policy_object"]
}

resource "sdwan_port_list_policy_object" "n386" {
  entries = local.m_386["entries"]
  name    = local.m_386["name"]
}
