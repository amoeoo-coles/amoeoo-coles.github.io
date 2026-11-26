# 377 · data source fmc_device_vni_interface · 4. Devices
# This data source reads the Device VNI Interface.
# Reads models/data_fmc_device_vni_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_377 = yamldecode(file("${path.module}/../models/data_fmc_device_vni_interface.yml"))["data_fmc_device_vni_interface"]
}

data "fmc_device_vni_interface" "n377" {
  device_id = local.m_377["device_id"]
  domain = local.m_377["domain"]
  id = local.m_377["id"]
  logical_name = local.m_377["logical_name"]
}

output "n377_data_fmc_device_vni_interface_id" {
  value = data.fmc_device_vni_interface.n377.id
}
