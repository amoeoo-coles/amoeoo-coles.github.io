# 084 · data source ise_device_admin_policy_set · 6. Device administration
# This data source can read the Device Admin Policy Set.
# Reads models/data_ise_device_admin_policy_set.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_084 = yamldecode(file("${path.module}/../models/data_ise_device_admin_policy_set.yml"))["data_ise_device_admin_policy_set"]
}

data "ise_device_admin_policy_set" "n084" {
  id = local.m_084["id"]
  name = local.m_084["name"]
}

output "n084_data_ise_device_admin_policy_set_id" {
  value = data.ise_device_admin_policy_set.n084.id
}
