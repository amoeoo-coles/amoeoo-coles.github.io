# 037 ndfc_interface_loopback — 6. Interfaces and access
# Provider CiscoDevNet/ndfc 0.3.1. Docs: https://registry.terraform.io/providers/CiscoDevNet/ndfc/0.3.1/docs/resources/interface_loopback
# Reads ../models/ndfc_interface_loopback.yml (yamldecode). Edit the model, not this file.

locals {
  ndfc_interface_loopback = yamldecode(file("${path.module}/../models/ndfc_interface_loopback.yml"))["ndfc_interface_loopback"]
}

resource "ndfc_interface_loopback" "this" {
  deploy        = local.ndfc_interface_loopback.deploy
  interfaces    = local.ndfc_interface_loopback.interfaces
  policy        = local.ndfc_interface_loopback.policy
  serial_number = local.ndfc_interface_loopback.serial_number
}
