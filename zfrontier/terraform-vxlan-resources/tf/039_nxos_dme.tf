# 039 nxos_dme — 7. Day 2 and operations
# Provider CiscoDevNet/nxos 0.22.3. Docs: https://registry.terraform.io/providers/CiscoDevNet/nxos/0.22.3/docs/resources/dme
# Reads ../models/nxos_dme.yml (yamldecode). Edit the model, not this file.

locals {
  nxos_dme = yamldecode(file("${path.module}/../models/nxos_dme.yml"))["nxos_dme"]
}

resource "nxos_dme" "this" {
  children   = local.nxos_dme.children
  class_name = local.nxos_dme.class_name
  content    = local.nxos_dme.content
  delete     = local.nxos_dme.delete
  device     = local.nxos_dme.device
  dn         = local.nxos_dme.dn
}
