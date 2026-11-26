# 037 · resource sdwan_policy_object_ipv4_prefix_list · 3. Policy objects and custom applications
# This resource can manage a Policy Object IPv4 Prefix List Policy_object. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_ipv4_prefix_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_037 = yamldecode(file("${path.module}/../models/sdwan_policy_object_ipv4_prefix_list.yml"))["sdwan_policy_object_ipv4_prefix_list"]
}

resource "sdwan_policy_object_ipv4_prefix_list" "n037" {
  description        = local.m_037["description"]
  entries            = local.m_037["entries"]
  feature_profile_id = local.m_037["feature_profile_id"]
  name               = local.m_037["name"]
}
