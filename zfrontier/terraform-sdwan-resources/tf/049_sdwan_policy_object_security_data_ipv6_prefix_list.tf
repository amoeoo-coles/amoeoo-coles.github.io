# 049 · resource sdwan_policy_object_security_data_ipv6_prefix_list · 3. Policy objects and custom applications
# This resource can manage a Policy Object Security Data IPv6 Prefix List Policy_object. Minimum SD-WAN Manager version: 20.18.2
# Reads models/sdwan_policy_object_security_data_ipv6_prefix_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_049 = yamldecode(file("${path.module}/../models/sdwan_policy_object_security_data_ipv6_prefix_list.yml"))["sdwan_policy_object_security_data_ipv6_prefix_list"]
}

resource "sdwan_policy_object_security_data_ipv6_prefix_list" "n049" {
  description = local.m_049["description"]
  entries = local.m_049["entries"]
  feature_profile_id = local.m_049["feature_profile_id"]
  name = local.m_049["name"]
}
