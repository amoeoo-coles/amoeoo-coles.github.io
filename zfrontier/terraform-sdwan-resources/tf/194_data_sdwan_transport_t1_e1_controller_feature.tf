# 194 · data source sdwan_transport_t1_e1_controller_feature · 6. Features: transport and management
# This data source can read the Transport T1 E1 Controller Feature.
# Reads models/data_sdwan_transport_t1_e1_controller_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_194 = yamldecode(file("${path.module}/../models/data_sdwan_transport_t1_e1_controller_feature.yml"))["data_sdwan_transport_t1_e1_controller_feature"]
}

data "sdwan_transport_t1_e1_controller_feature" "n194" {
  feature_profile_id = local.m_194["feature_profile_id"]
  id                 = local.m_194["id"]
  name               = local.m_194["name"]
}

output "n194_data_sdwan_transport_t1_e1_controller_feature_id" {
  value = data.sdwan_transport_t1_e1_controller_feature.n194.id
}
