# 052 · data source ise_network_access_condition · 5. Network access
# This data source can read the Network Access Condition.
# Reads models/data_ise_network_access_condition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_052 = yamldecode(file("${path.module}/../models/data_ise_network_access_condition.yml"))["data_ise_network_access_condition"]
}

data "ise_network_access_condition" "n052" {
  id = local.m_052["id"]
  name = local.m_052["name"]
}

output "n052_data_ise_network_access_condition_id" {
  value = data.ise_network_access_condition.n052.id
}
