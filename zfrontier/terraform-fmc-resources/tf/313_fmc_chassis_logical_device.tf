# 313 · resource fmc_chassis_logical_device · 4. Devices
# This resource manages a Chassis Logical Device. Creating this resource will initiate a chassis-level deployment, triggering the device creation process based on the logical device configuration defined within this resource. Newly created device will be auto-registered with FMC. Destruction of the 
# Reads models/fmc_chassis_logical_device.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_313 = yamldecode(file("${path.module}/../models/fmc_chassis_logical_device.yml"))["fmc_chassis_logical_device"]
}

resource "fmc_chassis_logical_device" "n313" {
  access_control_policy_id = local.m_313["access_control_policy_id"]
  admin_state = local.m_313["admin_state"]
  assigned_interfaces = local.m_313["assigned_interfaces"]
  chassis_id = local.m_313["chassis_id"]
  device_group_id = local.m_313["device_group_id"]
  device_password = try(var.secrets["fmc_chassis_logical_device.device_password"], local.m_313["device_password"])
  dns_servers = local.m_313["dns_servers"]
  domain = local.m_313["domain"]
  firewall_mode = local.m_313["firewall_mode"]
  fqdn = local.m_313["fqdn"]
  ftd_version = local.m_313["ftd_version"]
  ipv4_address = local.m_313["ipv4_address"]
  ipv4_gateway = local.m_313["ipv4_gateway"]
  ipv4_netmask = local.m_313["ipv4_netmask"]
  ipv6_address = local.m_313["ipv6_address"]
  ipv6_gateway = local.m_313["ipv6_gateway"]
  ipv6_prefix = local.m_313["ipv6_prefix"]
  licenses = local.m_313["licenses"]
  name = local.m_313["name"]
  permit_expert_mode = local.m_313["permit_expert_mode"]
  platform_settings_id = local.m_313["platform_settings_id"]
  resource_profile_id = local.m_313["resource_profile_id"]
  resource_profile_name = local.m_313["resource_profile_name"]
  search_domain = local.m_313["search_domain"]
}
