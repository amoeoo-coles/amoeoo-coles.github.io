# 074 · data source ise_device_admin_authorization_global_exception_rule · 6. Device administration
# This data source can read the Device Admin Authorization Global Exception Rule.
# Reads models/data_ise_device_admin_authorization_global_exception_rule.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_074 = yamldecode(file("${path.module}/../models/data_ise_device_admin_authorization_global_exception_rule.yml"))["data_ise_device_admin_authorization_global_exception_rule"]
}

data "ise_device_admin_authorization_global_exception_rule" "n074" {
  id   = local.m_074["id"]
  name = local.m_074["name"]
}

output "n074_data_ise_device_admin_authorization_global_exception_rule_id" {
  value = data.ise_device_admin_authorization_global_exception_rule.n074.id
}
