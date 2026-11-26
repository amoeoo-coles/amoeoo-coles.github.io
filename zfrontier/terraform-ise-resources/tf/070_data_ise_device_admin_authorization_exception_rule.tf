# 070 · data source ise_device_admin_authorization_exception_rule · 6. Device administration
# This data source can read the Device Admin Authorization Exception Rule.
# Reads models/data_ise_device_admin_authorization_exception_rule.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_070 = yamldecode(file("${path.module}/../models/data_ise_device_admin_authorization_exception_rule.yml"))["data_ise_device_admin_authorization_exception_rule"]
}

data "ise_device_admin_authorization_exception_rule" "n070" {
  id = local.m_070["id"]
  name = local.m_070["name"]
  policy_set_id = local.m_070["policy_set_id"]
}

output "n070_data_ise_device_admin_authorization_exception_rule_id" {
  value = data.ise_device_admin_authorization_exception_rule.n070.id
}
