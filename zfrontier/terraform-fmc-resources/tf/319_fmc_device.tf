# 319 · resource fmc_device · 4. Devices
# This resource manages a Device. This resource is not supported in cdFMC - to register the device in cdFMC, please use Security Cloud Control API instead.
# Reads models/fmc_device.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_319 = yamldecode(file("${path.module}/../models/fmc_device.yml"))["fmc_device"]
}

resource "fmc_device" "n319" {
  access_control_policy_domain = local.m_319["access_control_policy_domain"]
  access_control_policy_id = local.m_319["access_control_policy_id"]
  deploy_on_destroy = local.m_319["deploy_on_destroy"]
  device_group_id = local.m_319["device_group_id"]
  domain = local.m_319["domain"]
  health_policy_domain = local.m_319["health_policy_domain"]
  health_policy_id = local.m_319["health_policy_id"]
  host = local.m_319["host"]
  licenses = local.m_319["licenses"]
  name = local.m_319["name"]
  nat_id = local.m_319["nat_id"]
  nat_policy_domain = local.m_319["nat_policy_domain"]
  nat_policy_id = local.m_319["nat_policy_id"]
  object_group_search = local.m_319["object_group_search"]
  performance_tier = local.m_319["performance_tier"]
  prohibit_packet_transfer = local.m_319["prohibit_packet_transfer"]
  registration_key = try(var.secrets["fmc_device.registration_key"], local.m_319["registration_key"])
  snort_engine = local.m_319["snort_engine"]
}
