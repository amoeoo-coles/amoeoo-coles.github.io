# 109 · resource catalystcenter_lan_automation · 6. Templates, profiles and LAN automation
# This resource can Start LAN Automation on resource creation and Stop LAN Automation on resource deletion
# Reads models/catalystcenter_lan_automation.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_109 = yamldecode(file("${path.module}/../models/catalystcenter_lan_automation.yml"))["catalystcenter_lan_automation"]
}

resource "catalystcenter_lan_automation" "n109" {
  discovered_device_site_name_hierarchy = local.m_109["discovered_device_site_name_hierarchy"]
  discovery_devices = local.m_109["discovery_devices"]
  discovery_level = local.m_109["discovery_level"]
  discovery_timeout = local.m_109["discovery_timeout"]
  host_name_file_id = local.m_109["host_name_file_id"]
  host_name_prefix = local.m_109["host_name_prefix"]
  ip_pools = local.m_109["ip_pools"]
  isis_domain_password = local.m_109["isis_domain_password"]
  isis_domain_password_wo = try(var.secrets["catalystcenter_lan_automation.isis_domain_password_wo"], local.m_109["isis_domain_password_wo"])
  isis_domain_password_wo_version = local.m_109["isis_domain_password_wo_version"]
  multicast_enabled = local.m_109["multicast_enabled"]
  peer_device_management_ip_address = local.m_109["peer_device_management_ip_address"]
  primary_device_interface_names = local.m_109["primary_device_interface_names"]
  primary_device_management_ip_address = local.m_109["primary_device_management_ip_address"]
  redistribute_isis_to_bgp = local.m_109["redistribute_isis_to_bgp"]
}
