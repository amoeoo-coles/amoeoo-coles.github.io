# 385 · data source sdwan_policer_policy_object · 10. (Classic) policy objects
# This data source can read the Policer Policy Object .
# Reads models/data_sdwan_policer_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_385 = yamldecode(file("${path.module}/../models/data_sdwan_policer_policy_object.yml"))["data_sdwan_policer_policy_object"]
}

data "sdwan_policer_policy_object" "n385" {
  id = local.m_385["id"]
}

output "n385_data_sdwan_policer_policy_object_id" {
  value = data.sdwan_policer_policy_object.n385.id
}
