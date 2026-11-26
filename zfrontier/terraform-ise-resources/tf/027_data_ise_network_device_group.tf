# 027 · data source ise_network_device_group · 3. Network resources
# This data source can read the Network Device Group.
# Reads models/data_ise_network_device_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_027 = yamldecode(file("${path.module}/../models/data_ise_network_device_group.yml"))["data_ise_network_device_group"]
}

data "ise_network_device_group" "n027" {
  id = local.m_027["id"]
  name = local.m_027["name"]
}

output "n027_data_ise_network_device_group_id" {
  value = data.ise_network_device_group.n027.id
}
