# 320 · data source sdwan_other_thousandeyes_feature · 8. Features: CLI, topology, SIG, SSE and other
# This data source can read the Other ThousandEyes Feature.
# Reads models/data_sdwan_other_thousandeyes_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_320 = yamldecode(file("${path.module}/../models/data_sdwan_other_thousandeyes_feature.yml"))["data_sdwan_other_thousandeyes_feature"]
}

data "sdwan_other_thousandeyes_feature" "n320" {
  feature_profile_id = local.m_320["feature_profile_id"]
  id = local.m_320["id"]
  name = local.m_320["name"]
}

output "n320_data_sdwan_other_thousandeyes_feature_id" {
  value = data.sdwan_other_thousandeyes_feature.n320.id
}
