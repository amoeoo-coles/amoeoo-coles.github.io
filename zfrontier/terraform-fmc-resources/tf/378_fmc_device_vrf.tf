# 378 · resource fmc_device_vrf · 4. Devices
# This resource manages a Device VRF.
# Reads models/fmc_device_vrf.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_378 = yamldecode(file("${path.module}/../models/fmc_device_vrf.yml"))["fmc_device_vrf"]
}

resource "fmc_device_vrf" "n378" {
  description = local.m_378["description"]
  device_id   = local.m_378["device_id"]
  domain      = local.m_378["domain"]
  interfaces  = local.m_378["interfaces"]
  name        = local.m_378["name"]
}
