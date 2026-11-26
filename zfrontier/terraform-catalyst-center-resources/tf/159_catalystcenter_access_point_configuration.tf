# 159 · resource catalystcenter_access_point_configuration · 8. Wireless
# This resource configures one or more access points using the Catalyst Center "Configure Access Points V1" intent API. Access points are selected by their ethernet MAC address. The endpoint is an asynchronous action API: each create issues a POST and waits for the resulting task to complete. There 
# Reads models/catalystcenter_access_point_configuration.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_159 = yamldecode(file("${path.module}/../models/catalystcenter_access_point_configuration.yml"))["catalystcenter_access_point_configuration"]
}

resource "catalystcenter_access_point_configuration" "n159" {
  admin_status                   = local.m_159["admin_status"]
  ap_list                        = local.m_159["ap_list"]
  ap_mode                        = local.m_159["ap_mode"]
  configure_admin_status         = local.m_159["configure_admin_status"]
  configure_ap_mode              = local.m_159["configure_ap_mode"]
  configure_failover_priority    = local.m_159["configure_failover_priority"]
  configure_ha_controller        = local.m_159["configure_ha_controller"]
  configure_led_brightness_level = local.m_159["configure_led_brightness_level"]
  configure_led_status           = local.m_159["configure_led_status"]
  configure_location             = local.m_159["configure_location"]
  failover_priority              = local.m_159["failover_priority"]
  is_assigned_site_as_location   = local.m_159["is_assigned_site_as_location"]
  led_brightness_level           = local.m_159["led_brightness_level"]
  led_status                     = local.m_159["led_status"]
  location                       = local.m_159["location"]
  primary_controller_name        = local.m_159["primary_controller_name"]
  primary_ip_address             = local.m_159["primary_ip_address"]
  radio_configurations           = local.m_159["radio_configurations"]
  secondary_controller_name      = local.m_159["secondary_controller_name"]
  secondary_ip_address           = local.m_159["secondary_ip_address"]
  tertiary_controller_name       = local.m_159["tertiary_controller_name"]
  tertiary_ip_address            = local.m_159["tertiary_ip_address"]
}
