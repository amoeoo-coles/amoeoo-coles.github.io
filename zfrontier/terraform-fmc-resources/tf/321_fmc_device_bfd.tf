# 321 · resource fmc_device_bfd · 4. Devices
# This resource manages a Device BFD. The following restrictions apply: Minimum FMC version: 7.4
# Reads models/fmc_device_bfd.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_321 = yamldecode(file("${path.module}/../models/fmc_device_bfd.yml"))["fmc_device_bfd"]
}

resource "fmc_device_bfd" "n321" {
  bfd_template_id            = local.m_321["bfd_template_id"]
  destination_host_object_id = local.m_321["destination_host_object_id"]
  device_id                  = local.m_321["device_id"]
  domain                     = local.m_321["domain"]
  hop_type                   = local.m_321["hop_type"]
  interface_id               = local.m_321["interface_id"]
  interface_logical_name     = local.m_321["interface_logical_name"]
  slow_timer                 = local.m_321["slow_timer"]
  source_host_object_id      = local.m_321["source_host_object_id"]
  vrf_id                     = local.m_321["vrf_id"]
}
