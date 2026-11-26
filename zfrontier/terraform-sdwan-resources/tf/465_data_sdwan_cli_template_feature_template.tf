# 465 · data source sdwan_cli_template_feature_template · 11. (Classic) feature templates
# This data source can read the CLI Template feature template.
# Reads models/data_sdwan_cli_template_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_465 = yamldecode(file("${path.module}/../models/data_sdwan_cli_template_feature_template.yml"))["data_sdwan_cli_template_feature_template"]
}

data "sdwan_cli_template_feature_template" "n465" {
  id   = local.m_465["id"]
  name = local.m_465["name"]
}

output "n465_data_sdwan_cli_template_feature_template_id" {
  value = data.sdwan_cli_template_feature_template.n465.id
}
