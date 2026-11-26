# 031 nxos_subinterface — 6. Interfaces and access
# Provider CiscoDevNet/nxos 0.22.3. Docs: https://registry.terraform.io/providers/CiscoDevNet/nxos/0.22.3/docs/resources/subinterface
# Reads ../models/nxos_subinterface.yml (yamldecode). Edit the model, not this file.

locals {
  nxos_subinterface = yamldecode(file("${path.module}/../models/nxos_subinterface.yml"))["nxos_subinterface"]
}

resource "nxos_subinterface" "this" {
  deletion_policy = local.nxos_subinterface.deletion_policy
  device          = local.nxos_subinterface.device
  subinterfaces   = local.nxos_subinterface.subinterfaces
}
