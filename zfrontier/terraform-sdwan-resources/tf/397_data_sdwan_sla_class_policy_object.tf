# 397 · data source sdwan_sla_class_policy_object · 10. (Classic) policy objects
# This data source can read the SLA Class Policy Object .
# Reads models/data_sdwan_sla_class_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_397 = yamldecode(file("${path.module}/../models/data_sdwan_sla_class_policy_object.yml"))["data_sdwan_sla_class_policy_object"]
}

data "sdwan_sla_class_policy_object" "n397" {
  id = local.m_397["id"]
}

output "n397_data_sdwan_sla_class_policy_object_id" {
  value = data.sdwan_sla_class_policy_object.n397.id
}
