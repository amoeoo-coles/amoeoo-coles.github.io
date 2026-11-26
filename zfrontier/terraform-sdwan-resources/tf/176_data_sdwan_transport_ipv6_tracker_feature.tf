# 176 · data source sdwan_transport_ipv6_tracker_feature · 6. Features: transport and management
# This data source can read the Transport IPv6 Tracker Feature.
# Reads models/data_sdwan_transport_ipv6_tracker_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_176 = yamldecode(file("${path.module}/../models/data_sdwan_transport_ipv6_tracker_feature.yml"))["data_sdwan_transport_ipv6_tracker_feature"]
}

data "sdwan_transport_ipv6_tracker_feature" "n176" {
  feature_profile_id = local.m_176["feature_profile_id"]
  id                 = local.m_176["id"]
  name               = local.m_176["name"]
}

output "n176_data_sdwan_transport_ipv6_tracker_feature_id" {
  value = data.sdwan_transport_ipv6_tracker_feature.n176.id
}
