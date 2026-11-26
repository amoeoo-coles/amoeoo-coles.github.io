# 316 · data source sdwan_sse_cisco_feature · 8. Features: CLI, topology, SIG, SSE and other
# This data source can read the SSE Cisco Feature.
# Reads models/data_sdwan_sse_cisco_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_316 = yamldecode(file("${path.module}/../models/data_sdwan_sse_cisco_feature.yml"))["data_sdwan_sse_cisco_feature"]
}

data "sdwan_sse_cisco_feature" "n316" {
  feature_profile_id = local.m_316["feature_profile_id"]
  id                 = local.m_316["id"]
  name               = local.m_316["name"]
}

output "n316_data_sdwan_sse_cisco_feature_id" {
  value = data.sdwan_sse_cisco_feature.n316.id
}
