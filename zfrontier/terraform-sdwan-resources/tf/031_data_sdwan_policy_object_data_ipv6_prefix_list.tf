# 031 · data source sdwan_policy_object_data_ipv6_prefix_list · 3. Policy objects and custom applications
# This data source can read the Policy Object Data IPv6 Prefix List Policy_object.
# Reads models/data_sdwan_policy_object_data_ipv6_prefix_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_031 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_data_ipv6_prefix_list.yml"))["data_sdwan_policy_object_data_ipv6_prefix_list"]
}

data "sdwan_policy_object_data_ipv6_prefix_list" "n031" {
  feature_profile_id = local.m_031["feature_profile_id"]
  id = local.m_031["id"]
  name = local.m_031["name"]
}

output "n031_data_sdwan_policy_object_data_ipv6_prefix_list_id" {
  value = data.sdwan_policy_object_data_ipv6_prefix_list.n031.id
}
