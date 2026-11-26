# 175 · resource catalystcenter_wireless_interface · 8. Wireless
# This resource can manage a Wireless Interface.
# Reads models/catalystcenter_wireless_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_175 = yamldecode(file("${path.module}/../models/catalystcenter_wireless_interface.yml"))["catalystcenter_wireless_interface"]
}

resource "catalystcenter_wireless_interface" "n175" {
  interface_name = local.m_175["interface_name"]
  vlan_id = local.m_175["vlan_id"]
}
