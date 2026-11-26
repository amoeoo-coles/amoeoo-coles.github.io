# 407 · data source sdwan_cedge_aaa_feature_template · 11. (Classic) feature templates
# This data source can read the cEdge AAA feature template.
# Reads models/data_sdwan_cedge_aaa_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_407 = yamldecode(file("${path.module}/../models/data_sdwan_cedge_aaa_feature_template.yml"))["data_sdwan_cedge_aaa_feature_template"]
}

data "sdwan_cedge_aaa_feature_template" "n407" {
  id = local.m_407["id"]
  name = local.m_407["name"]
}

output "n407_data_sdwan_cedge_aaa_feature_template_id" {
  value = data.sdwan_cedge_aaa_feature_template.n407.id
}
