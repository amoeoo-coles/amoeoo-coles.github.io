# 040 nxos_cli — 7. Day 2 and operations
# Provider CiscoDevNet/nxos 0.22.3. Docs: https://registry.terraform.io/providers/CiscoDevNet/nxos/0.22.3/docs/resources/cli
# Reads ../models/nxos_cli.yml (yamldecode). Edit the model, not this file.

locals {
  nxos_cli = yamldecode(file("${path.module}/../models/nxos_cli.yml"))["nxos_cli"]
}

resource "nxos_cli" "this" {
  cli    = local.nxos_cli.cli
  device = local.nxos_cli.device
}
