# 022 nxos_bridge_domain — 5. Networks and L2VNI
# Provider CiscoDevNet/nxos 0.22.3. Docs: https://registry.terraform.io/providers/CiscoDevNet/nxos/0.22.3/docs/resources/bridge_domain
# Reads ../models/nxos_bridge_domain.yml (yamldecode). Edit the model, not this file.

locals {
  nxos_bridge_domain = yamldecode(file("${path.module}/../models/nxos_bridge_domain.yml"))["nxos_bridge_domain"]
}

resource "nxos_bridge_domain" "this" {
  bridge_domains      = local.nxos_bridge_domain.bridge_domains
  deletion_policy     = local.nxos_bridge_domain.deletion_policy
  device              = local.nxos_bridge_domain.device
  svi_autostate       = local.nxos_bridge_domain.svi_autostate
  vlan_configurations = local.nxos_bridge_domain.vlan_configurations
}
