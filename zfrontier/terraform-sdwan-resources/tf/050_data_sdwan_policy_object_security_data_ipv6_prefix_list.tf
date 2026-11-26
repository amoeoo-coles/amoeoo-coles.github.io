# 050 · data source sdwan_policy_object_security_data_ipv6_prefix_list · 3. Policy objects and custom applications
# This data source can read the Policy Object Security Data IPv6 Prefix List Policy_object.
# Reads models/data_sdwan_policy_object_security_data_ipv6_prefix_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_050 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_security_data_ipv6_prefix_list.yml"))["data_sdwan_policy_object_security_data_ipv6_prefix_list"]
}

data "sdwan_policy_object_security_data_ipv6_prefix_list" "n050" {
  feature_profile_id = local.m_050["feature_profile_id"]
  id                 = local.m_050["id"]
  name               = local.m_050["name"]
}

output "n050_data_sdwan_policy_object_security_data_ipv6_prefix_list_id" {
  value = data.sdwan_policy_object_security_data_ipv6_prefix_list.n050.id
}
