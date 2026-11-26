# 082 · data source ise_device_admin_condition · 6. Device administration
# This data source can read the Device Admin Condition.
# Reads models/data_ise_device_admin_condition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_082 = yamldecode(file("${path.module}/../models/data_ise_device_admin_condition.yml"))["data_ise_device_admin_condition"]
}

data "ise_device_admin_condition" "n082" {
  id   = local.m_082["id"]
  name = local.m_082["name"]
}

output "n082_data_ise_device_admin_condition_id" {
  value = data.ise_device_admin_condition.n082.id
}
