# 144 · data source sdwan_system_ipv6_device_access_feature · 5. Features: system
# This data source can read the System IPv6 Device Access Feature.
# Reads models/data_sdwan_system_ipv6_device_access_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_144 = yamldecode(file("${path.module}/../models/data_sdwan_system_ipv6_device_access_feature.yml"))["data_sdwan_system_ipv6_device_access_feature"]
}

data "sdwan_system_ipv6_device_access_feature" "n144" {
  feature_profile_id = local.m_144["feature_profile_id"]
  id = local.m_144["id"]
  name = local.m_144["name"]
}

output "n144_data_sdwan_system_ipv6_device_access_feature_id" {
  value = data.sdwan_system_ipv6_device_access_feature.n144.id
}
