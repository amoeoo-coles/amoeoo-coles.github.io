# 018 nxos_evpn — 3. VTEP and overlay
# Provider CiscoDevNet/nxos 0.22.3. Docs: https://registry.terraform.io/providers/CiscoDevNet/nxos/0.22.3/docs/resources/evpn
# Reads ../models/nxos_evpn.yml (yamldecode). Edit the model, not this file.

locals {
  nxos_evpn = yamldecode(file("${path.module}/../models/nxos_evpn.yml"))["nxos_evpn"]
}

resource "nxos_evpn" "this" {
  admin_state     = local.nxos_evpn.admin_state
  deletion_policy = local.nxos_evpn.deletion_policy
  device          = local.nxos_evpn.device
  vnis            = local.nxos_evpn.vnis
}
