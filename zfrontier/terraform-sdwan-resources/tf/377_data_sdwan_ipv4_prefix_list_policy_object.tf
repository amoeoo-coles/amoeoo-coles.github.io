# 377 · data source sdwan_ipv4_prefix_list_policy_object · 10. (Classic) policy objects
# This data source can read the IPv4 Prefix List Policy Object .
# Reads models/data_sdwan_ipv4_prefix_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_377 = yamldecode(file("${path.module}/../models/data_sdwan_ipv4_prefix_list_policy_object.yml"))["data_sdwan_ipv4_prefix_list_policy_object"]
}

data "sdwan_ipv4_prefix_list_policy_object" "n377" {
  id = local.m_377["id"]
}

output "n377_data_sdwan_ipv4_prefix_list_policy_object_id" {
  value = data.sdwan_ipv4_prefix_list_policy_object.n377.id
}
