# 036 ndfc_interface_vpc — 6. Interfaces and access
# Provider CiscoDevNet/ndfc 0.3.1. Docs: https://registry.terraform.io/providers/CiscoDevNet/ndfc/0.3.1/docs/resources/interface_vpc
# Reads ../models/ndfc_interface_vpc.yml (yamldecode). Edit the model, not this file.

locals {
  ndfc_interface_vpc = yamldecode(file("${path.module}/../models/ndfc_interface_vpc.yml"))["ndfc_interface_vpc"]
}

resource "ndfc_interface_vpc" "this" {
  deploy        = local.ndfc_interface_vpc.deploy
  interfaces    = local.ndfc_interface_vpc.interfaces
  policy        = local.ndfc_interface_vpc.policy
  serial_number = local.ndfc_interface_vpc.serial_number
}
