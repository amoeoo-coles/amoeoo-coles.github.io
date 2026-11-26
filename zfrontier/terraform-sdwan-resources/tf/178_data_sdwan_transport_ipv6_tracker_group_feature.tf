# 178 · data source sdwan_transport_ipv6_tracker_group_feature · 6. Features: transport and management
# This data source can read the Transport IPv6 Tracker Group Feature.
# Reads models/data_sdwan_transport_ipv6_tracker_group_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_178 = yamldecode(file("${path.module}/../models/data_sdwan_transport_ipv6_tracker_group_feature.yml"))["data_sdwan_transport_ipv6_tracker_group_feature"]
}

data "sdwan_transport_ipv6_tracker_group_feature" "n178" {
  feature_profile_id = local.m_178["feature_profile_id"]
  id                 = local.m_178["id"]
  name               = local.m_178["name"]
}

output "n178_data_sdwan_transport_ipv6_tracker_group_feature_id" {
  value = data.sdwan_transport_ipv6_tracker_group_feature.n178.id
}
