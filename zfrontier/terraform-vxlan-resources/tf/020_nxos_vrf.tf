# 020 nxos_vrf — 4. VRFs and L3VNI
# Provider CiscoDevNet/nxos 0.22.3. Docs: https://registry.terraform.io/providers/CiscoDevNet/nxos/0.22.3/docs/resources/vrf
# Reads ../models/nxos_vrf.yml (yamldecode). Edit the model, not this file.

locals {
  nxos_vrf = yamldecode(file("${path.module}/../models/nxos_vrf.yml"))["nxos_vrf"]
}

resource "nxos_vrf" "this" {
  deletion_policy = local.nxos_vrf.deletion_policy
  device          = local.nxos_vrf.device
  vrfs            = local.nxos_vrf.vrfs
}
