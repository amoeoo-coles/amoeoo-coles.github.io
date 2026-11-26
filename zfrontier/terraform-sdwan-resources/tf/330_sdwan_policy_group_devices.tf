# 330 · resource sdwan_policy_group_devices · 9. Configuration, policy and topology groups
# This resource can manage a Policy Group Devices . Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_group_devices.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_330 = yamldecode(file("${path.module}/../models/sdwan_policy_group_devices.yml"))["sdwan_policy_group_devices"]
}

resource "sdwan_policy_group_devices" "n330" {
  devices = local.m_330["devices"]
  policy_group_id = local.m_330["policy_group_id"]
  policy_group_version = local.m_330["policy_group_version"]
  retain_devices = local.m_330["retain_devices"]
  solution = local.m_330["solution"]
}
