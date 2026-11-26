# 044 · data source ise_network_access_authorization_global_exception_rule · 5. Network access
# This data source can read the Network Access Authorization Global Exception Rule.
# Reads models/data_ise_network_access_authorization_global_exception_rule.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_044 = yamldecode(file("${path.module}/../models/data_ise_network_access_authorization_global_exception_rule.yml"))["data_ise_network_access_authorization_global_exception_rule"]
}

data "ise_network_access_authorization_global_exception_rule" "n044" {
  id   = local.m_044["id"]
  name = local.m_044["name"]
}

output "n044_data_ise_network_access_authorization_global_exception_rule_id" {
  value = data.ise_network_access_authorization_global_exception_rule.n044.id
}
