# 413 · data source sdwan_cedge_multicast_feature_template · 11. (Classic) feature templates
# This data source can read the cEdge Multicast feature template.
# Reads models/data_sdwan_cedge_multicast_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_413 = yamldecode(file("${path.module}/../models/data_sdwan_cedge_multicast_feature_template.yml"))["data_sdwan_cedge_multicast_feature_template"]
}

data "sdwan_cedge_multicast_feature_template" "n413" {
  id = local.m_413["id"]
  name = local.m_413["name"]
}

output "n413_data_sdwan_cedge_multicast_feature_template_id" {
  value = data.sdwan_cedge_multicast_feature_template.n413.id
}
