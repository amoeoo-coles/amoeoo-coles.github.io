# 088 · data source ise_device_admin_time_and_date_condition · 6. Device administration
# This data source can read the Device Admin Time And Date Condition.
# Reads models/data_ise_device_admin_time_and_date_condition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_088 = yamldecode(file("${path.module}/../models/data_ise_device_admin_time_and_date_condition.yml"))["data_ise_device_admin_time_and_date_condition"]
}

data "ise_device_admin_time_and_date_condition" "n088" {
  id   = local.m_088["id"]
  name = local.m_088["name"]
}

output "n088_data_ise_device_admin_time_and_date_condition_id" {
  value = data.ise_device_admin_time_and_date_condition.n088.id
}
