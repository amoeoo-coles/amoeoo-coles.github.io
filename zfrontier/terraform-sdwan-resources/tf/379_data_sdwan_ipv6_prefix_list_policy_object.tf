# 379 · data source sdwan_ipv6_prefix_list_policy_object · 10. (Classic) policy objects
# This data source can read the IPv6 Prefix List Policy Object .
# Reads models/data_sdwan_ipv6_prefix_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_379 = yamldecode(file("${path.module}/../models/data_sdwan_ipv6_prefix_list_policy_object.yml"))["data_sdwan_ipv6_prefix_list_policy_object"]
}

data "sdwan_ipv6_prefix_list_policy_object" "n379" {
  id = local.m_379["id"]
}

output "n379_data_sdwan_ipv6_prefix_list_policy_object_id" {
  value = data.sdwan_ipv6_prefix_list_policy_object.n379.id
}
