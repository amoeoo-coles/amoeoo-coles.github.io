# 326 · data source sdwan_configuration_group · 9. Configuration, policy and topology groups
# This data source can read the Configuration Group .
# Reads models/data_sdwan_configuration_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_326 = yamldecode(file("${path.module}/../models/data_sdwan_configuration_group.yml"))["data_sdwan_configuration_group"]
}

data "sdwan_configuration_group" "n326" {
  id   = local.m_326["id"]
  name = local.m_326["name"]
}

output "n326_data_sdwan_configuration_group_id" {
  value = data.sdwan_configuration_group.n326.id
}
