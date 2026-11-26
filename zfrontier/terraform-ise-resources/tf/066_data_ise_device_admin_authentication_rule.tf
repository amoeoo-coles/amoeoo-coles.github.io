# 066 · data source ise_device_admin_authentication_rule · 6. Device administration
# This data source can read the Device Admin Authentication Rule.
# Reads models/data_ise_device_admin_authentication_rule.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_066 = yamldecode(file("${path.module}/../models/data_ise_device_admin_authentication_rule.yml"))["data_ise_device_admin_authentication_rule"]
}

data "ise_device_admin_authentication_rule" "n066" {
  id            = local.m_066["id"]
  name          = local.m_066["name"]
  policy_set_id = local.m_066["policy_set_id"]
}

output "n066_data_ise_device_admin_authentication_rule_id" {
  value = data.ise_device_admin_authentication_rule.n066.id
}
