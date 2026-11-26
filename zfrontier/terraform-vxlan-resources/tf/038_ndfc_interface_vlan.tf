# 038 ndfc_interface_vlan — 6. Interfaces and access
# Provider CiscoDevNet/ndfc 0.3.1. Docs: https://registry.terraform.io/providers/CiscoDevNet/ndfc/0.3.1/docs/resources/interface_vlan
# Reads ../models/ndfc_interface_vlan.yml (yamldecode). Edit the model, not this file.

locals {
  ndfc_interface_vlan = yamldecode(file("${path.module}/../models/ndfc_interface_vlan.yml"))["ndfc_interface_vlan"]
}

resource "ndfc_interface_vlan" "this" {
  deploy        = local.ndfc_interface_vlan.deploy
  interfaces    = local.ndfc_interface_vlan.interfaces
  policy        = local.ndfc_interface_vlan.policy
  serial_number = local.ndfc_interface_vlan.serial_number
}
