# 036 · data source ise_network_access_authentication_rule · 5. Network access
# This data source can read the Network Access Authentication Rule.
# Reads models/data_ise_network_access_authentication_rule.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_036 = yamldecode(file("${path.module}/../models/data_ise_network_access_authentication_rule.yml"))["data_ise_network_access_authentication_rule"]
}

data "ise_network_access_authentication_rule" "n036" {
  id = local.m_036["id"]
  name = local.m_036["name"]
  policy_set_id = local.m_036["policy_set_id"]
}

output "n036_data_ise_network_access_authentication_rule_id" {
  value = data.ise_network_access_authentication_rule.n036.id
}
