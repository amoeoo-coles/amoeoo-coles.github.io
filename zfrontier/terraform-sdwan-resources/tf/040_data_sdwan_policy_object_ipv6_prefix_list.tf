# 040 · data source sdwan_policy_object_ipv6_prefix_list · 3. Policy objects and custom applications
# This data source can read the Policy Object IPv6 Prefix List Policy_object.
# Reads models/data_sdwan_policy_object_ipv6_prefix_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_040 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_ipv6_prefix_list.yml"))["data_sdwan_policy_object_ipv6_prefix_list"]
}

data "sdwan_policy_object_ipv6_prefix_list" "n040" {
  feature_profile_id = local.m_040["feature_profile_id"]
  id                 = local.m_040["id"]
  name               = local.m_040["name"]
}

output "n040_data_sdwan_policy_object_ipv6_prefix_list_id" {
  value = data.sdwan_policy_object_ipv6_prefix_list.n040.id
}
