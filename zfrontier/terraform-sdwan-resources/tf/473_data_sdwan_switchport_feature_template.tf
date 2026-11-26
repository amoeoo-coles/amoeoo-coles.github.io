# 473 · data source sdwan_switchport_feature_template · 11. (Classic) feature templates
# This data source can read the Switchport feature template.
# Reads models/data_sdwan_switchport_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_473 = yamldecode(file("${path.module}/../models/data_sdwan_switchport_feature_template.yml"))["data_sdwan_switchport_feature_template"]
}

data "sdwan_switchport_feature_template" "n473" {
  id   = local.m_473["id"]
  name = local.m_473["name"]
}

output "n473_data_sdwan_switchport_feature_template_id" {
  value = data.sdwan_switchport_feature_template.n473.id
}
