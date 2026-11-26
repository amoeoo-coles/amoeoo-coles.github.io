# 174 · data source sdwan_transport_ipv6_acl_feature · 6. Features: transport and management
# This data source can read the Transport IPv6 ACL Feature.
# Reads models/data_sdwan_transport_ipv6_acl_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_174 = yamldecode(file("${path.module}/../models/data_sdwan_transport_ipv6_acl_feature.yml"))["data_sdwan_transport_ipv6_acl_feature"]
}

data "sdwan_transport_ipv6_acl_feature" "n174" {
  feature_profile_id = local.m_174["feature_profile_id"]
  id = local.m_174["id"]
  name = local.m_174["name"]
}

output "n174_data_sdwan_transport_ipv6_acl_feature_id" {
  value = data.sdwan_transport_ipv6_acl_feature.n174.id
}
