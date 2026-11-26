# 160 · data source sdwan_system_snmp_feature · 5. Features: system
# This data source can read the System SNMP Feature.
# Reads models/data_sdwan_system_snmp_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_160 = yamldecode(file("${path.module}/../models/data_sdwan_system_snmp_feature.yml"))["data_sdwan_system_snmp_feature"]
}

data "sdwan_system_snmp_feature" "n160" {
  feature_profile_id = local.m_160["feature_profile_id"]
  id                 = local.m_160["id"]
  name               = local.m_160["name"]
}

output "n160_data_sdwan_system_snmp_feature_id" {
  value = data.sdwan_system_snmp_feature.n160.id
}
