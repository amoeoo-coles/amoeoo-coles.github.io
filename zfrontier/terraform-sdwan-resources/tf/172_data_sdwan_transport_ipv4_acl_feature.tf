# 172 · data source sdwan_transport_ipv4_acl_feature · 6. Features: transport and management
# This data source can read the Transport IPv4 ACL Feature.
# Reads models/data_sdwan_transport_ipv4_acl_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_172 = yamldecode(file("${path.module}/../models/data_sdwan_transport_ipv4_acl_feature.yml"))["data_sdwan_transport_ipv4_acl_feature"]
}

data "sdwan_transport_ipv4_acl_feature" "n172" {
  feature_profile_id = local.m_172["feature_profile_id"]
  id                 = local.m_172["id"]
  name               = local.m_172["name"]
}

output "n172_data_sdwan_transport_ipv4_acl_feature_id" {
  value = data.sdwan_transport_ipv4_acl_feature.n172.id
}
