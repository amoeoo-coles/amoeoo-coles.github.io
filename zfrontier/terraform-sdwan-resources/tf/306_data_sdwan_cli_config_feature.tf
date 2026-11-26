# 306 · data source sdwan_cli_config_feature · 8. Features: CLI, topology, SIG, SSE and other
# This data source can read the CLI Config Feature .
# Reads models/data_sdwan_cli_config_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_306 = yamldecode(file("${path.module}/../models/data_sdwan_cli_config_feature.yml"))["data_sdwan_cli_config_feature"]
}

data "sdwan_cli_config_feature" "n306" {
  feature_profile_id = local.m_306["feature_profile_id"]
  id                 = local.m_306["id"]
}

output "n306_data_sdwan_cli_config_feature_id" {
  value = data.sdwan_cli_config_feature.n306.id
}
