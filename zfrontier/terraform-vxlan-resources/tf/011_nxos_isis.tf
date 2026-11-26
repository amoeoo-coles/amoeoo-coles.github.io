# 011 nxos_isis — 2. Underlay
# Provider CiscoDevNet/nxos 0.22.3. Docs: https://registry.terraform.io/providers/CiscoDevNet/nxos/0.22.3/docs/resources/isis
# Reads ../models/nxos_isis.yml (yamldecode). Edit the model, not this file.

locals {
  nxos_isis = yamldecode(file("${path.module}/../models/nxos_isis.yml"))["nxos_isis"]
}

resource "nxos_isis" "this" {
  admin_state     = local.nxos_isis.admin_state
  deletion_policy = local.nxos_isis.deletion_policy
  device          = local.nxos_isis.device
  instances       = local.nxos_isis.instances
  interfaces      = local.nxos_isis.interfaces
}
