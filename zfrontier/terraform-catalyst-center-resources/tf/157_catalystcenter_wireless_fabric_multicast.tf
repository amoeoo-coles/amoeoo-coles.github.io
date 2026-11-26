# 157 · resource catalystcenter_wireless_fabric_multicast · 7. SD-Access
# This resource manages the Wireless Multicast setting for a fabric site in Cisco Catalyst Center. It enables or disables multicast traffic forwarding to wireless clients within the specified fabric site. The fabric site must have a Wireless Controller assigned (WIRELESS_CONTROLLER_NODE role) and at
# Reads models/catalystcenter_wireless_fabric_multicast.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_157 = yamldecode(file("${path.module}/../models/catalystcenter_wireless_fabric_multicast.yml"))["catalystcenter_wireless_fabric_multicast"]
}

resource "catalystcenter_wireless_fabric_multicast" "n157" {
  fabric_id         = local.m_157["fabric_id"]
  multicast_enabled = local.m_157["multicast_enabled"]
}
