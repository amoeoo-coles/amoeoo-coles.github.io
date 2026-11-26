# 246 · data source sdwan_service_ipv6_acl_feature · 7. Features: service
# This data source can read the Service IPv6 ACL Feature.
# Reads models/data_sdwan_service_ipv6_acl_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_246 = yamldecode(file("${path.module}/../models/data_sdwan_service_ipv6_acl_feature.yml"))["data_sdwan_service_ipv6_acl_feature"]
}

data "sdwan_service_ipv6_acl_feature" "n246" {
  feature_profile_id = local.m_246["feature_profile_id"]
  id                 = local.m_246["id"]
  name               = local.m_246["name"]
}

output "n246_data_sdwan_service_ipv6_acl_feature_id" {
  value = data.sdwan_service_ipv6_acl_feature.n246.id
}
