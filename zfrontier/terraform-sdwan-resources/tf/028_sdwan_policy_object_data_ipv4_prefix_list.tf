# 028 · resource sdwan_policy_object_data_ipv4_prefix_list · 3. Policy objects and custom applications
# This resource can manage a Policy Object Data IPv4 Prefix List Policy_object. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_data_ipv4_prefix_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_028 = yamldecode(file("${path.module}/../models/sdwan_policy_object_data_ipv4_prefix_list.yml"))["sdwan_policy_object_data_ipv4_prefix_list"]
}

resource "sdwan_policy_object_data_ipv4_prefix_list" "n028" {
  description = local.m_028["description"]
  entries = local.m_028["entries"]
  feature_profile_id = local.m_028["feature_profile_id"]
  name = local.m_028["name"]
}
