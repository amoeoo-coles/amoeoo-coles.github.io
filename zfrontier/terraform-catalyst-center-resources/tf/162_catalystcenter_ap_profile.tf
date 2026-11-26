# 162 · resource catalystcenter_ap_profile · 8. Wireless
# This resource manages an Access Point (AP) Profile in wireless settings.
# Reads models/catalystcenter_ap_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_162 = yamldecode(file("${path.module}/../models/catalystcenter_ap_profile.yml"))["catalystcenter_ap_profile"]
}

resource "catalystcenter_ap_profile" "n162" {
  ap_power_profile_name                 = local.m_162["ap_power_profile_name"]
  ap_profile_name                       = local.m_162["ap_profile_name"]
  auth_type                             = local.m_162["auth_type"]
  awips_enabled                         = local.m_162["awips_enabled"]
  awips_forensic_enabled                = local.m_162["awips_forensic_enabled"]
  backhaul_client_access                = local.m_162["backhaul_client_access"]
  bridge_group_name                     = local.m_162["bridge_group_name"]
  calendar_power_profiles               = local.m_162["calendar_power_profiles"]
  cdp_state                             = local.m_162["cdp_state"]
  client_limit                          = local.m_162["client_limit"]
  country_code                          = local.m_162["country_code"]
  description                           = local.m_162["description"]
  dot1x_password                        = local.m_162["dot1x_password"]
  dot1x_password_wo                     = local.m_162["dot1x_password_wo"]
  dot1x_password_wo_version             = local.m_162["dot1x_password_wo_version"]
  dot1x_username                        = local.m_162["dot1x_username"]
  ghz24_backhaul_data_rates             = local.m_162["ghz24_backhaul_data_rates"]
  ghz5_backhaul_data_rates              = local.m_162["ghz5_backhaul_data_rates"]
  management_enable_password            = local.m_162["management_enable_password"]
  management_enable_password_wo         = local.m_162["management_enable_password_wo"]
  management_enable_password_wo_version = local.m_162["management_enable_password_wo_version"]
  management_password                   = local.m_162["management_password"]
  management_password_wo                = local.m_162["management_password_wo"]
  management_password_wo_version        = local.m_162["management_password_wo_version"]
  management_user_name                  = local.m_162["management_user_name"]
  mesh_enabled                          = local.m_162["mesh_enabled"]
  pmf_denial_enabled                    = local.m_162["pmf_denial_enabled"]
  range                                 = local.m_162["range"]
  rap_downlink_backhaul                 = local.m_162["rap_downlink_backhaul"]
  remote_worker_enabled                 = local.m_162["remote_worker_enabled"]
  rogue_detection                       = local.m_162["rogue_detection"]
  rogue_detection_min_rssi              = local.m_162["rogue_detection_min_rssi"]
  rogue_detection_report_interval       = local.m_162["rogue_detection_report_interval"]
  rogue_detection_transient_interval    = local.m_162["rogue_detection_transient_interval"]
  ssh_enabled                           = local.m_162["ssh_enabled"]
  telnet_enabled                        = local.m_162["telnet_enabled"]
  time_zone                             = local.m_162["time_zone"]
  time_zone_offset_hour                 = local.m_162["time_zone_offset_hour"]
  time_zone_offset_minutes              = local.m_162["time_zone_offset_minutes"]
}
