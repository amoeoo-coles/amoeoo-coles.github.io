# 008 nxos_loopback_interface — 2. Underlay
# Provider CiscoDevNet/nxos 0.22.3. Docs: https://registry.terraform.io/providers/CiscoDevNet/nxos/0.22.3/docs/resources/loopback_interface
# Reads ../models/nxos_loopback_interface.yml (yamldecode). Edit the model, not this file.

locals {
  nxos_loopback_interface = yamldecode(file("${path.module}/../models/nxos_loopback_interface.yml"))["nxos_loopback_interface"]
}

resource "nxos_loopback_interface" "this" {
  deletion_policy     = local.nxos_loopback_interface.deletion_policy
  device              = local.nxos_loopback_interface.device
  loopback_interfaces = local.nxos_loopback_interface.loopback_interfaces
}
