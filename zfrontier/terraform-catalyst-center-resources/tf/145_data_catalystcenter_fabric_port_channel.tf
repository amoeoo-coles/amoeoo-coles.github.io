# 145 · data source catalystcenter_fabric_port_channel · 7. SD-Access
# This data source can read the Fabric Port Channel.
# Reads models/data_catalystcenter_fabric_port_channel.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_145 = yamldecode(file("${path.module}/../models/data_catalystcenter_fabric_port_channel.yml"))["data_catalystcenter_fabric_port_channel"]
}

data "catalystcenter_fabric_port_channel" "n145" {
  fabric_id = local.m_145["fabric_id"]
  id = local.m_145["id"]
  network_device_id = local.m_145["network_device_id"]
}

output "n145_data_catalystcenter_fabric_port_channel_id" {
  value = data.catalystcenter_fabric_port_channel.n145.id
}
