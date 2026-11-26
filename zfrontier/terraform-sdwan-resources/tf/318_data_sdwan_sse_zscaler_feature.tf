# 318 · data source sdwan_sse_zscaler_feature · 8. Features: CLI, topology, SIG, SSE and other
# This data source can read the SSE Zscaler Feature.
# Reads models/data_sdwan_sse_zscaler_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_318 = yamldecode(file("${path.module}/../models/data_sdwan_sse_zscaler_feature.yml"))["data_sdwan_sse_zscaler_feature"]
}

data "sdwan_sse_zscaler_feature" "n318" {
  feature_profile_id = local.m_318["feature_profile_id"]
  id                 = local.m_318["id"]
  name               = local.m_318["name"]
}

output "n318_data_sdwan_sse_zscaler_feature_id" {
  value = data.sdwan_sse_zscaler_feature.n318.id
}
