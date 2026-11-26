# 041 nxos_save_config — 7. Day 2 and operations
# Provider CiscoDevNet/nxos 0.22.3. Docs: https://registry.terraform.io/providers/CiscoDevNet/nxos/0.22.3/docs/resources/save_config
# Reads ../models/nxos_save_config.yml (yamldecode). Edit the model, not this file.

locals {
  nxos_save_config = yamldecode(file("${path.module}/../models/nxos_save_config.yml"))["nxos_save_config"]
}

resource "nxos_save_config" "this" {
  device = local.nxos_save_config.device
  save   = local.nxos_save_config.save
}
