# 494 · data source sdwan_feature_device_template · 12. (Classic) device templates
# This data source can read the Feature Device Template .
# Reads models/data_sdwan_feature_device_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_494 = yamldecode(file("${path.module}/../models/data_sdwan_feature_device_template.yml"))["data_sdwan_feature_device_template"]
}

data "sdwan_feature_device_template" "n494" {
  id = local.m_494["id"]
}

output "n494_data_sdwan_feature_device_template_id" {
  value = data.sdwan_feature_device_template.n494.id
}
