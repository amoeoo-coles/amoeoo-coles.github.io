# 365 · data source fmc_device_ospf_interface · 4. Devices
# This data source reads the Device OSPF Interface. The following restrictions apply: Minimum FMC version: 7.6
# Reads models/data_fmc_device_ospf_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_365 = yamldecode(file("${path.module}/../models/data_fmc_device_ospf_interface.yml"))["data_fmc_device_ospf_interface"]
}

data "fmc_device_ospf_interface" "n365" {
  device_id = local.m_365["device_id"]
  domain = local.m_365["domain"]
  id = local.m_365["id"]
  vrf_id = local.m_365["vrf_id"]
}

output "n365_data_fmc_device_ospf_interface_id" {
  value = data.fmc_device_ospf_interface.n365.id
}
