# 469 · data source sdwan_gps_feature_template · 11. (Classic) feature templates
# This data source can read the gps feature template.
# Reads models/data_sdwan_gps_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_469 = yamldecode(file("${path.module}/../models/data_sdwan_gps_feature_template.yml"))["data_sdwan_gps_feature_template"]
}

data "sdwan_gps_feature_template" "n469" {
  id   = local.m_469["id"]
  name = local.m_469["name"]
}

output "n469_data_sdwan_gps_feature_template_id" {
  value = data.sdwan_gps_feature_template.n469.id
}
