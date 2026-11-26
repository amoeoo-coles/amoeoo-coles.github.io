# 014 nxos_msdp — 2. Underlay
# Provider CiscoDevNet/nxos 0.22.3. Docs: https://registry.terraform.io/providers/CiscoDevNet/nxos/0.22.3/docs/resources/msdp
# Reads ../models/nxos_msdp.yml (yamldecode). Edit the model, not this file.

locals {
  nxos_msdp = yamldecode(file("${path.module}/../models/nxos_msdp.yml"))["nxos_msdp"]
}

resource "nxos_msdp" "this" {
  admin_state          = local.nxos_msdp.admin_state
  deletion_policy      = local.nxos_msdp.deletion_policy
  device               = local.nxos_msdp.device
  instance_admin_state = local.nxos_msdp.instance_admin_state
  instance_control     = local.nxos_msdp.instance_control
  vrfs                 = local.nxos_msdp.vrfs
}
