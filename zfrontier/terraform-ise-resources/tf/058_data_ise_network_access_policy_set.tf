# 058 · data source ise_network_access_policy_set · 5. Network access
# This data source can read the Network Access Policy Set.
# Reads models/data_ise_network_access_policy_set.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_058 = yamldecode(file("${path.module}/../models/data_ise_network_access_policy_set.yml"))["data_ise_network_access_policy_set"]
}

data "ise_network_access_policy_set" "n058" {
  id = local.m_058["id"]
  name = local.m_058["name"]
}

output "n058_data_ise_network_access_policy_set_id" {
  value = data.ise_network_access_policy_set.n058.id
}
