# 313 · resource sdwan_sig_feature · 8. Features: CLI, topology, SIG, SSE and other
# This resource can manage a SIG (Secure Internet Gateway) Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_sig_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_313 = yamldecode(file("${path.module}/../models/sdwan_sig_feature.yml"))["sdwan_sig_feature"]
}

resource "sdwan_sig_feature" "n313" {
  aup_enabled                             = local.m_313["aup_enabled"]
  aup_timeout                             = local.m_313["aup_timeout"]
  auth_required                           = local.m_313["auth_required"]
  block_internet_until_accepted           = local.m_313["block_internet_until_accepted"]
  caution_enabled                         = local.m_313["caution_enabled"]
  description                             = local.m_313["description"]
  display_time_unit                       = local.m_313["display_time_unit"]
  feature_profile_id                      = local.m_313["feature_profile_id"]
  force_ssl_inspection                    = local.m_313["force_ssl_inspection"]
  idle_time                               = local.m_313["idle_time"]
  interface_pairs                         = local.m_313["interface_pairs"]
  interfaces                              = local.m_313["interfaces"]
  ip_enforced_for_known_browsers          = local.m_313["ip_enforced_for_known_browsers"]
  ips_control                             = local.m_313["ips_control"]
  location_name                           = local.m_313["location_name"]
  location_name_variable                  = local.m_313["location_name_variable"]
  name                                    = local.m_313["name"]
  ofw_enabled                             = local.m_313["ofw_enabled"]
  refresh_time                            = local.m_313["refresh_time"]
  refresh_time_unit                       = local.m_313["refresh_time_unit"]
  sig_provider                            = local.m_313["sig_provider"]
  src_vpn                                 = local.m_313["src_vpn"]
  surrogate_ip                            = local.m_313["surrogate_ip"]
  tracker_source_ip                       = local.m_313["tracker_source_ip"]
  tracker_source_ip_variable              = local.m_313["tracker_source_ip_variable"]
  trackers                                = local.m_313["trackers"]
  umbrella_primary_data_center            = local.m_313["umbrella_primary_data_center"]
  umbrella_primary_data_center_variable   = local.m_313["umbrella_primary_data_center_variable"]
  umbrella_secondary_data_center          = local.m_313["umbrella_secondary_data_center"]
  umbrella_secondary_data_center_variable = local.m_313["umbrella_secondary_data_center_variable"]
  xff_forward_enabled                     = local.m_313["xff_forward_enabled"]
  zscaler_primary_data_center             = local.m_313["zscaler_primary_data_center"]
  zscaler_primary_data_center_variable    = local.m_313["zscaler_primary_data_center_variable"]
  zscaler_secondary_data_center           = local.m_313["zscaler_secondary_data_center"]
  zscaler_secondary_data_center_variable  = local.m_313["zscaler_secondary_data_center_variable"]
}
