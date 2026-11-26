# 062 · data source ise_network_access_time_and_date_condition · 5. Network access
# This data source can read the Network Access Time And Date Condition.
# Reads models/data_ise_network_access_time_and_date_condition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_062 = yamldecode(file("${path.module}/../models/data_ise_network_access_time_and_date_condition.yml"))["data_ise_network_access_time_and_date_condition"]
}

data "ise_network_access_time_and_date_condition" "n062" {
  id   = local.m_062["id"]
  name = local.m_062["name"]
}

output "n062_data_ise_network_access_time_and_date_condition_id" {
  value = data.ise_network_access_time_and_date_condition.n062.id
}
