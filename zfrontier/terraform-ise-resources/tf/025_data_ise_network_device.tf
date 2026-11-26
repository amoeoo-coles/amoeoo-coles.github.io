# 025 · data source ise_network_device · 3. Network resources
# This data source can read the Network Device.
# Reads models/data_ise_network_device.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_025 = yamldecode(file("${path.module}/../models/data_ise_network_device.yml"))["data_ise_network_device"]
}

data "ise_network_device" "n025" {
  id   = local.m_025["id"]
  name = local.m_025["name"]
}

output "n025_data_ise_network_device_id" {
  value = data.ise_network_device.n025.id
}
