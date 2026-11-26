# 111 · resource catalystcenter_lan_automation_link · 6. Templates, profiles and LAN automation
# This resource adds or deletes a Layer 3 link between two LAN-automated devices using the DAY-N updateDevice API. Use action ADD_LINK to create a link or DELETE_LINK to remove one. When the resource is destroyed or refreshed, no actions are performed on Catalyst Center.
# Reads models/catalystcenter_lan_automation_link.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_111 = yamldecode(file("${path.module}/../models/catalystcenter_lan_automation_link.yml"))["catalystcenter_lan_automation_link"]
}

resource "catalystcenter_lan_automation_link" "n111" {
  action = local.m_111["action"]
  ip_pool_name = local.m_111["ip_pool_name"]
  peer_device_interface_name = local.m_111["peer_device_interface_name"]
  peer_device_management_ip_address = local.m_111["peer_device_management_ip_address"]
  primary_device_interface_name = local.m_111["primary_device_interface_name"]
  primary_device_management_ip_address = local.m_111["primary_device_management_ip_address"]
}
