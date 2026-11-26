# 347 · data source fmc_device_etherchannel_interface · 4. Devices
# This data source reads the Device EtherChannel Interface.
# Reads models/data_fmc_device_etherchannel_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_347 = yamldecode(file("${path.module}/../models/data_fmc_device_etherchannel_interface.yml"))["data_fmc_device_etherchannel_interface"]
}

data "fmc_device_etherchannel_interface" "n347" {
  device_id = local.m_347["device_id"]
  domain = local.m_347["domain"]
  id = local.m_347["id"]
  logical_name = local.m_347["logical_name"]
  name = local.m_347["name"]
}

output "n347_data_fmc_device_etherchannel_interface_id" {
  value = data.fmc_device_etherchannel_interface.n347.id
}
