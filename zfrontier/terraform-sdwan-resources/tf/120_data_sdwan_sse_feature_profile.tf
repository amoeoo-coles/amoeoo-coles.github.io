# 120 · data source sdwan_sse_feature_profile · 4. Feature profiles
# This data source can read the SSE Feature Profile .
# Reads models/data_sdwan_sse_feature_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_120 = yamldecode(file("${path.module}/../models/data_sdwan_sse_feature_profile.yml"))["data_sdwan_sse_feature_profile"]
}

data "sdwan_sse_feature_profile" "n120" {
  id   = local.m_120["id"]
  name = local.m_120["name"]
}

output "n120_data_sdwan_sse_feature_profile_id" {
  value = data.sdwan_sse_feature_profile.n120.id
}
