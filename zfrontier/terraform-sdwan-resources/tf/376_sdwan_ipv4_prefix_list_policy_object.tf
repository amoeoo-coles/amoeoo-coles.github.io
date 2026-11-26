# 376 · resource sdwan_ipv4_prefix_list_policy_object · 10. (Classic) policy objects
# This resource can manage a IPv4 Prefix List Policy Object .
# Reads models/sdwan_ipv4_prefix_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_376 = yamldecode(file("${path.module}/../models/sdwan_ipv4_prefix_list_policy_object.yml"))["sdwan_ipv4_prefix_list_policy_object"]
}

resource "sdwan_ipv4_prefix_list_policy_object" "n376" {
  entries = local.m_376["entries"]
  name = local.m_376["name"]
}
