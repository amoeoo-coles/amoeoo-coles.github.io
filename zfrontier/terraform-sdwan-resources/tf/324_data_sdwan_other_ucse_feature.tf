# 324 · data source sdwan_other_ucse_feature · 8. Features: CLI, topology, SIG, SSE and other
# This data source can read the Other UCSE Feature.
# Reads models/data_sdwan_other_ucse_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_324 = yamldecode(file("${path.module}/../models/data_sdwan_other_ucse_feature.yml"))["data_sdwan_other_ucse_feature"]
}

data "sdwan_other_ucse_feature" "n324" {
  feature_profile_id = local.m_324["feature_profile_id"]
  id = local.m_324["id"]
  name = local.m_324["name"]
}

output "n324_data_sdwan_other_ucse_feature_id" {
  value = data.sdwan_other_ucse_feature.n324.id
}
