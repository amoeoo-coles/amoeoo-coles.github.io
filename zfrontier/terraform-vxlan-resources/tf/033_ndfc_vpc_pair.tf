# 033 ndfc_vpc_pair — 6. Interfaces and access
# Provider CiscoDevNet/ndfc 0.3.1. Docs: https://registry.terraform.io/providers/CiscoDevNet/ndfc/0.3.1/docs/resources/vpc_pair
# Reads ../models/ndfc_vpc_pair.yml (yamldecode). Edit the model, not this file.

locals {
  ndfc_vpc_pair = yamldecode(file("${path.module}/../models/ndfc_vpc_pair.yml"))["ndfc_vpc_pair"]
}

resource "ndfc_vpc_pair" "this" {
  deploy               = local.ndfc_vpc_pair.deploy
  serial_numbers       = local.ndfc_vpc_pair.serial_numbers
  use_virtual_peerlink = local.ndfc_vpc_pair.use_virtual_peerlink
}
