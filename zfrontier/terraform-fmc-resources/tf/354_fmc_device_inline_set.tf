# 354 · resource fmc_device_inline_set · 4. Devices
# This resource manages an Inline Set on a device.
# Reads models/fmc_device_inline_set.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_354 = yamldecode(file("${path.module}/../models/fmc_device_inline_set.yml"))["fmc_device_inline_set"]
}

resource "fmc_device_inline_set" "n354" {
  bypass_force = local.m_354["bypass_force"]
  bypass_standby = local.m_354["bypass_standby"]
  device_id = local.m_354["device_id"]
  domain = local.m_354["domain"]
  fail_safe = local.m_354["fail_safe"]
  interface_pairs = local.m_354["interface_pairs"]
  mtu = local.m_354["mtu"]
  name = local.m_354["name"]
  propagate_link_state = local.m_354["propagate_link_state"]
  snort_fail_open_busy = local.m_354["snort_fail_open_busy"]
  snort_fail_open_down = local.m_354["snort_fail_open_down"]
  strict_tcp_enforcement = local.m_354["strict_tcp_enforcement"]
  tap_mode = local.m_354["tap_mode"]
}
