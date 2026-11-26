# 034 ndfc_interface_ethernet — 6. Interfaces and access
# Provider CiscoDevNet/ndfc 0.3.1. Docs: https://registry.terraform.io/providers/CiscoDevNet/ndfc/0.3.1/docs/resources/interface_ethernet
# Reads ../models/ndfc_interface_ethernet.yml (yamldecode). Edit the model, not this file.

locals {
  ndfc_interface_ethernet = yamldecode(file("${path.module}/../models/ndfc_interface_ethernet.yml"))["ndfc_interface_ethernet"]
}

resource "ndfc_interface_ethernet" "this" {
  deploy        = local.ndfc_interface_ethernet.deploy
  interfaces    = local.ndfc_interface_ethernet.interfaces
  policy        = local.ndfc_interface_ethernet.policy
  policy_type   = local.ndfc_interface_ethernet.policy_type
  serial_number = local.ndfc_interface_ethernet.serial_number
}
