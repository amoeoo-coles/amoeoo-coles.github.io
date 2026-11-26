# 024 nxos_svi_interface — 5. Networks and L2VNI
# Provider CiscoDevNet/nxos 0.22.3. Docs: https://registry.terraform.io/providers/CiscoDevNet/nxos/0.22.3/docs/resources/svi_interface
# Reads ../models/nxos_svi_interface.yml (yamldecode). Edit the model, not this file.

locals {
  nxos_svi_interface = yamldecode(file("${path.module}/../models/nxos_svi_interface.yml"))["nxos_svi_interface"]
}

resource "nxos_svi_interface" "this" {
  deletion_policy = local.nxos_svi_interface.deletion_policy
  device          = local.nxos_svi_interface.device
  svi_interfaces  = local.nxos_svi_interface.svi_interfaces
}
