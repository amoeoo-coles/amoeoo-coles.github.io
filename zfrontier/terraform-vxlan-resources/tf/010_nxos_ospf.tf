# 010 nxos_ospf — 2. Underlay
# Provider CiscoDevNet/nxos 0.22.3. Docs: https://registry.terraform.io/providers/CiscoDevNet/nxos/0.22.3/docs/resources/ospf
# Reads ../models/nxos_ospf.yml (yamldecode). Edit the model, not this file.

locals {
  nxos_ospf = yamldecode(file("${path.module}/../models/nxos_ospf.yml"))["nxos_ospf"]
}

resource "nxos_ospf" "this" {
  admin_state     = local.nxos_ospf.admin_state
  deletion_policy = local.nxos_ospf.deletion_policy
  device          = local.nxos_ospf.device
  instances       = local.nxos_ospf.instances
}
