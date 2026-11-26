# 419 · data source sdwan_cellular_controller_feature_template · 11. (Classic) feature templates
# This data source can read the Cellular Controller feature template.
# Reads models/data_sdwan_cellular_controller_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_419 = yamldecode(file("${path.module}/../models/data_sdwan_cellular_controller_feature_template.yml"))["data_sdwan_cellular_controller_feature_template"]
}

data "sdwan_cellular_controller_feature_template" "n419" {
  id   = local.m_419["id"]
  name = local.m_419["name"]
}

output "n419_data_sdwan_cellular_controller_feature_template_id" {
  value = data.sdwan_cellular_controller_feature_template.n419.id
}
