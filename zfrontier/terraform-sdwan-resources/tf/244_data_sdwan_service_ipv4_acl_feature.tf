# 244 · data source sdwan_service_ipv4_acl_feature · 7. Features: service
# This data source can read the Service IPv4 ACL Feature.
# Reads models/data_sdwan_service_ipv4_acl_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_244 = yamldecode(file("${path.module}/../models/data_sdwan_service_ipv4_acl_feature.yml"))["data_sdwan_service_ipv4_acl_feature"]
}

data "sdwan_service_ipv4_acl_feature" "n244" {
  feature_profile_id = local.m_244["feature_profile_id"]
  id = local.m_244["id"]
  name = local.m_244["name"]
}

output "n244_data_sdwan_service_ipv4_acl_feature_id" {
  value = data.sdwan_service_ipv4_acl_feature.n244.id
}
