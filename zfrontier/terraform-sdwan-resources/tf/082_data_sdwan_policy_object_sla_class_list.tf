# 082 · data source sdwan_policy_object_sla_class_list · 3. Policy objects and custom applications
# This data source can read the Policy Object SLA Class List Policy_object.
# Reads models/data_sdwan_policy_object_sla_class_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_082 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_sla_class_list.yml"))["data_sdwan_policy_object_sla_class_list"]
}

data "sdwan_policy_object_sla_class_list" "n082" {
  feature_profile_id = local.m_082["feature_profile_id"]
  id                 = local.m_082["id"]
  name               = local.m_082["name"]
}

output "n082_data_sdwan_policy_object_sla_class_list_id" {
  value = data.sdwan_policy_object_sla_class_list.n082.id
}
