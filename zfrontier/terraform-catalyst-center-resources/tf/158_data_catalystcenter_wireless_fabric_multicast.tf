# 158 · data source catalystcenter_wireless_fabric_multicast · 7. SD-Access
# This data source can read the Wireless Fabric Multicast.
# Reads models/data_catalystcenter_wireless_fabric_multicast.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_158 = yamldecode(file("${path.module}/../models/data_catalystcenter_wireless_fabric_multicast.yml"))["data_catalystcenter_wireless_fabric_multicast"]
}

data "catalystcenter_wireless_fabric_multicast" "n158" {
  fabric_id = local.m_158["fabric_id"]
}

output "n158_data_catalystcenter_wireless_fabric_multicast_id" {
  value = data.catalystcenter_wireless_fabric_multicast.n158.id
}
