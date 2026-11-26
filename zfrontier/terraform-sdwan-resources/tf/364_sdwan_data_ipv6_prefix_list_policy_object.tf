# 364 · resource sdwan_data_ipv6_prefix_list_policy_object · 10. (Classic) policy objects
# This resource can manage a Data IPv6 Prefix List Policy Object .
# Reads models/sdwan_data_ipv6_prefix_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_364 = yamldecode(file("${path.module}/../models/sdwan_data_ipv6_prefix_list_policy_object.yml"))["sdwan_data_ipv6_prefix_list_policy_object"]
}

resource "sdwan_data_ipv6_prefix_list_policy_object" "n364" {
  entries = local.m_364["entries"]
  name = local.m_364["name"]
}
