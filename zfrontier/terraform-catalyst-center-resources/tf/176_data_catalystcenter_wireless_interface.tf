# 176 · data source catalystcenter_wireless_interface · 8. Wireless
# This data source can read the Wireless Interface.
# Reads models/data_catalystcenter_wireless_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_176 = yamldecode(file("${path.module}/../models/data_catalystcenter_wireless_interface.yml"))["data_catalystcenter_wireless_interface"]
}

data "catalystcenter_wireless_interface" "n176" {
  interface_name = local.m_176["interface_name"]
}

output "n176_data_catalystcenter_wireless_interface_id" {
  value = data.catalystcenter_wireless_interface.n176.id
}
