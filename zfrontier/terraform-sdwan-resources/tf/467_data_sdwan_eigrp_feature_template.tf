# 467 · data source sdwan_eigrp_feature_template · 11. (Classic) feature templates
# This data source can read the eigrp feature template.
# Reads models/data_sdwan_eigrp_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_467 = yamldecode(file("${path.module}/../models/data_sdwan_eigrp_feature_template.yml"))["data_sdwan_eigrp_feature_template"]
}

data "sdwan_eigrp_feature_template" "n467" {
  id = local.m_467["id"]
  name = local.m_467["name"]
}

output "n467_data_sdwan_eigrp_feature_template_id" {
  value = data.sdwan_eigrp_feature_template.n467.id
}
