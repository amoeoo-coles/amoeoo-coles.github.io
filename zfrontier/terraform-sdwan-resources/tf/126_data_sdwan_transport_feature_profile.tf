# 126 · data source sdwan_transport_feature_profile · 4. Feature profiles
# This data source can read the Transport Feature Profile .
# Reads models/data_sdwan_transport_feature_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_126 = yamldecode(file("${path.module}/../models/data_sdwan_transport_feature_profile.yml"))["data_sdwan_transport_feature_profile"]
}

data "sdwan_transport_feature_profile" "n126" {
  id   = local.m_126["id"]
  name = local.m_126["name"]
}

output "n126_data_sdwan_transport_feature_profile_id" {
  value = data.sdwan_transport_feature_profile.n126.id
}
