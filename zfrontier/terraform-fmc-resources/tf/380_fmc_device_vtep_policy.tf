# 380 · resource fmc_device_vtep_policy · 4. Devices
# This resource can manage the Device VTEP Policy. Practicioners should ensure only one resource fmc_device_vtep_policy exists for a single fmc_device, because the FMC API responds with the same single Id for every request to create a new VTEP Policy on the same Device. Thus multiple resources per D
# Reads models/fmc_device_vtep_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_380 = yamldecode(file("${path.module}/../models/fmc_device_vtep_policy.yml"))["fmc_device_vtep_policy"]
}

resource "fmc_device_vtep_policy" "n380" {
  device_id   = local.m_380["device_id"]
  domain      = local.m_380["domain"]
  nve_enabled = local.m_380["nve_enabled"]
  vteps       = local.m_380["vteps"]
}
