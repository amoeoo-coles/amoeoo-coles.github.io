# 168 · resource catalystcenter_fabric_vlan_to_ssid · 8. Wireless
# Add, update, or remove SSID mappings to a VLAN. If the configuration does not contain a 'vlanName' which has SSIDs mapping done earlier then all the mapped SSIDs of the 'vlanName' are cleared. The request must include all SSIDs currently mapped to a VLAN, as determined by the response from the GET
# Reads models/catalystcenter_fabric_vlan_to_ssid.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_168 = yamldecode(file("${path.module}/../models/catalystcenter_fabric_vlan_to_ssid.yml"))["catalystcenter_fabric_vlan_to_ssid"]
}

resource "catalystcenter_fabric_vlan_to_ssid" "n168" {
  fabric_id = local.m_168["fabric_id"]
  mappings  = local.m_168["mappings"]
}
