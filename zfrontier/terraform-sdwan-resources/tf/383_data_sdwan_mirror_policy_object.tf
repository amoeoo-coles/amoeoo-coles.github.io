# 383 · data source sdwan_mirror_policy_object · 10. (Classic) policy objects
# This data source can read the Mirror Policy Object .
# Reads models/data_sdwan_mirror_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_383 = yamldecode(file("${path.module}/../models/data_sdwan_mirror_policy_object.yml"))["data_sdwan_mirror_policy_object"]
}

data "sdwan_mirror_policy_object" "n383" {
  id = local.m_383["id"]
}

output "n383_data_sdwan_mirror_policy_object_id" {
  value = data.sdwan_mirror_policy_object.n383.id
}
