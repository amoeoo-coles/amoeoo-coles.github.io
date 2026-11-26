# 415 · data source sdwan_cedge_pim_feature_template · 11. (Classic) feature templates
# This data source can read the cEdge PIM feature template.
# Reads models/data_sdwan_cedge_pim_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_415 = yamldecode(file("${path.module}/../models/data_sdwan_cedge_pim_feature_template.yml"))["data_sdwan_cedge_pim_feature_template"]
}

data "sdwan_cedge_pim_feature_template" "n415" {
  id = local.m_415["id"]
  name = local.m_415["name"]
}

output "n415_data_sdwan_cedge_pim_feature_template_id" {
  value = data.sdwan_cedge_pim_feature_template.n415.id
}
