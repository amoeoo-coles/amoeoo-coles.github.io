# 106 · data source sdwan_cli_feature_profile · 4. Feature profiles
# This data source can read the CLI Feature Profile .
# Reads models/data_sdwan_cli_feature_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_106 = yamldecode(file("${path.module}/../models/data_sdwan_cli_feature_profile.yml"))["data_sdwan_cli_feature_profile"]
}

data "sdwan_cli_feature_profile" "n106" {
  id = local.m_106["id"]
  name = local.m_106["name"]
}

output "n106_data_sdwan_cli_feature_profile_id" {
  value = data.sdwan_cli_feature_profile.n106.id
}
