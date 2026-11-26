# 040 · data source ise_network_access_authorization_exception_rule · 5. Network access
# This data source can read the Network Access Authorization Exception Rule.
# Reads models/data_ise_network_access_authorization_exception_rule.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_040 = yamldecode(file("${path.module}/../models/data_ise_network_access_authorization_exception_rule.yml"))["data_ise_network_access_authorization_exception_rule"]
}

data "ise_network_access_authorization_exception_rule" "n040" {
  id            = local.m_040["id"]
  name          = local.m_040["name"]
  policy_set_id = local.m_040["policy_set_id"]
}

output "n040_data_ise_network_access_authorization_exception_rule_id" {
  value = data.ise_network_access_authorization_exception_rule.n040.id
}
