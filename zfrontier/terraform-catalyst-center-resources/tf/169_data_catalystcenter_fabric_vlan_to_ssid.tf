# 169 · data source catalystcenter_fabric_vlan_to_ssid · 8. Wireless
# This data source can read the Fabric VLAN to SSID.
# Reads models/data_catalystcenter_fabric_vlan_to_ssid.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_169 = yamldecode(file("${path.module}/../models/data_catalystcenter_fabric_vlan_to_ssid.yml"))["data_catalystcenter_fabric_vlan_to_ssid"]
}

data "catalystcenter_fabric_vlan_to_ssid" "n169" {
  fabric_id = local.m_169["fabric_id"]
  id        = local.m_169["id"]
}

output "n169_data_catalystcenter_fabric_vlan_to_ssid_id" {
  value = data.catalystcenter_fabric_vlan_to_ssid.n169.id
}
