# 078 · data source ise_device_admin_authorization_rule · 6. Device administration
# This data source can read the Device Admin Authorization Rule.
# Reads models/data_ise_device_admin_authorization_rule.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_078 = yamldecode(file("${path.module}/../models/data_ise_device_admin_authorization_rule.yml"))["data_ise_device_admin_authorization_rule"]
}

data "ise_device_admin_authorization_rule" "n078" {
  id = local.m_078["id"]
  name = local.m_078["name"]
  policy_set_id = local.m_078["policy_set_id"]
}

output "n078_data_ise_device_admin_authorization_rule_id" {
  value = data.ise_device_admin_authorization_rule.n078.id
}
