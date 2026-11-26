# 342 · resource fmc_device_ecmp_zone · 4. Devices
# This resource manages Equal-Cost Multipath Routing (ECMP) zone.
# Reads models/fmc_device_ecmp_zone.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_342 = yamldecode(file("${path.module}/../models/fmc_device_ecmp_zone.yml"))["fmc_device_ecmp_zone"]
}

resource "fmc_device_ecmp_zone" "n342" {
  device_id  = local.m_342["device_id"]
  domain     = local.m_342["domain"]
  interfaces = local.m_342["interfaces"]
  name       = local.m_342["name"]
  vrf_id     = local.m_342["vrf_id"]
}
