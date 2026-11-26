# 417 · data source sdwan_cellular_cedge_profile_feature_template · 11. (Classic) feature templates
# This data source can read the Cellular cEdge Profile feature template.
# Reads models/data_sdwan_cellular_cedge_profile_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_417 = yamldecode(file("${path.module}/../models/data_sdwan_cellular_cedge_profile_feature_template.yml"))["data_sdwan_cellular_cedge_profile_feature_template"]
}

data "sdwan_cellular_cedge_profile_feature_template" "n417" {
  id = local.m_417["id"]
  name = local.m_417["name"]
}

output "n417_data_sdwan_cellular_cedge_profile_feature_template_id" {
  value = data.sdwan_cellular_cedge_profile_feature_template.n417.id
}
