# 035 ndfc_interface_portchannel — 6. Interfaces and access
# Provider CiscoDevNet/ndfc 0.3.1. Docs: https://registry.terraform.io/providers/CiscoDevNet/ndfc/0.3.1/docs/resources/interface_portchannel
# Reads ../models/ndfc_interface_portchannel.yml (yamldecode). Edit the model, not this file.

locals {
  ndfc_interface_portchannel = yamldecode(file("${path.module}/../models/ndfc_interface_portchannel.yml"))["ndfc_interface_portchannel"]
}

resource "ndfc_interface_portchannel" "this" {
  deploy        = local.ndfc_interface_portchannel.deploy
  interfaces    = local.ndfc_interface_portchannel.interfaces
  policy        = local.ndfc_interface_portchannel.policy
  serial_number = local.ndfc_interface_portchannel.serial_number
}
