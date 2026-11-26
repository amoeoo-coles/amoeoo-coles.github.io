# 039 · resource sdwan_policy_object_ipv6_prefix_list · 3. Policy objects and custom applications
# This resource can manage a Policy Object IPv6 Prefix List Policy_object. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_ipv6_prefix_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_039 = yamldecode(file("${path.module}/../models/sdwan_policy_object_ipv6_prefix_list.yml"))["sdwan_policy_object_ipv6_prefix_list"]
}

resource "sdwan_policy_object_ipv6_prefix_list" "n039" {
  description        = local.m_039["description"]
  entries            = local.m_039["entries"]
  feature_profile_id = local.m_039["feature_profile_id"]
  name               = local.m_039["name"]
}
