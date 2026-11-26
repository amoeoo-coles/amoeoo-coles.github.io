# 048 · data source ise_network_access_authorization_rule · 5. Network access
# This data source can read the Network Access Authorization Rule.
# Reads models/data_ise_network_access_authorization_rule.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_048 = yamldecode(file("${path.module}/../models/data_ise_network_access_authorization_rule.yml"))["data_ise_network_access_authorization_rule"]
}

data "ise_network_access_authorization_rule" "n048" {
  id = local.m_048["id"]
  name = local.m_048["name"]
  policy_set_id = local.m_048["policy_set_id"]
}

output "n048_data_ise_network_access_authorization_rule_id" {
  value = data.ise_network_access_authorization_rule.n048.id
}
