# 013 nxos_pim — 2. Underlay
# Provider CiscoDevNet/nxos 0.22.3. Docs: https://registry.terraform.io/providers/CiscoDevNet/nxos/0.22.3/docs/resources/pim
# Reads ../models/nxos_pim.yml (yamldecode). Edit the model, not this file.

locals {
  nxos_pim = yamldecode(file("${path.module}/../models/nxos_pim.yml"))["nxos_pim"]
}

resource "nxos_pim" "this" {
  admin_state                    = local.nxos_pim.admin_state
  control                        = local.nxos_pim.control
  deletion_policy                = local.nxos_pim.deletion_policy
  device                         = local.nxos_pim.device
  evpn_border_leaf               = local.nxos_pim.evpn_border_leaf
  extra_net                      = local.nxos_pim.extra_net
  instance_admin_state           = local.nxos_pim.instance_admin_state
  isolate                        = local.nxos_pim.isolate
  join_prune_delay               = local.nxos_pim.join_prune_delay
  log_level                      = local.nxos_pim.log_level
  null_register_delay            = local.nxos_pim.null_register_delay
  null_register_number_of_routes = local.nxos_pim.null_register_number_of_routes
  register_stop                  = local.nxos_pim.register_stop
  syslog_level                   = local.nxos_pim.syslog_level
  vrfs                           = local.nxos_pim.vrfs
}
