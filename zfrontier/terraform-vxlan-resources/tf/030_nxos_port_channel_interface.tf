# 030 nxos_port_channel_interface — 6. Interfaces and access
# Provider CiscoDevNet/nxos 0.22.3. Docs: https://registry.terraform.io/providers/CiscoDevNet/nxos/0.22.3/docs/resources/port_channel_interface
# Reads ../models/nxos_port_channel_interface.yml (yamldecode). Edit the model, not this file.

locals {
  nxos_port_channel_interface = yamldecode(file("${path.module}/../models/nxos_port_channel_interface.yml"))["nxos_port_channel_interface"]
}

resource "nxos_port_channel_interface" "this" {
  deletion_policy         = local.nxos_port_channel_interface.deletion_policy
  device                  = local.nxos_port_channel_interface.device
  port_channel_interfaces = local.nxos_port_channel_interface.port_channel_interfaces
}
