# 378 · resource sdwan_ipv6_prefix_list_policy_object · 10. (Classic) policy objects
# This resource can manage a IPv6 Prefix List Policy Object .
# Reads models/sdwan_ipv6_prefix_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_378 = yamldecode(file("${path.module}/../models/sdwan_ipv6_prefix_list_policy_object.yml"))["sdwan_ipv6_prefix_list_policy_object"]
}

resource "sdwan_ipv6_prefix_list_policy_object" "n378" {
  entries = local.m_378["entries"]
  name    = local.m_378["name"]
}
