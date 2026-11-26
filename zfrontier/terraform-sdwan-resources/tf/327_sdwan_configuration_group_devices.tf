# 327 · resource sdwan_configuration_group_devices · 9. Configuration, policy and topology groups
# This resource can manage a Configuration Group Devices . Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_configuration_group_devices.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_327 = yamldecode(file("${path.module}/../models/sdwan_configuration_group_devices.yml"))["sdwan_configuration_group_devices"]
}

resource "sdwan_configuration_group_devices" "n327" {
  configuration_group_id = local.m_327["configuration_group_id"]
  configuration_group_version = local.m_327["configuration_group_version"]
  devices = local.m_327["devices"]
  retain_devices = local.m_327["retain_devices"]
  solution = local.m_327["solution"]
}
