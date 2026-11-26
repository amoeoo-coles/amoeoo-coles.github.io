# 017 nxos_bgp — 3. VTEP and overlay
# Provider CiscoDevNet/nxos 0.22.3. Docs: https://registry.terraform.io/providers/CiscoDevNet/nxos/0.22.3/docs/resources/bgp
# Reads ../models/nxos_bgp.yml (yamldecode). Edit the model, not this file.

locals {
  nxos_bgp = yamldecode(file("${path.module}/../models/nxos_bgp.yml"))["nxos_bgp"]
}

resource "nxos_bgp" "this" {
  admin_state                              = local.nxos_bgp.admin_state
  asn                                      = local.nxos_bgp.asn
  control                                  = local.nxos_bgp.control
  deletion_policy                          = local.nxos_bgp.deletion_policy
  device                                   = local.nxos_bgp.device
  disable_policy_batching                  = local.nxos_bgp.disable_policy_batching
  disable_policy_batching_ipv4_prefix_list = local.nxos_bgp.disable_policy_batching_ipv4_prefix_list
  disable_policy_batching_ipv6_prefix_list = local.nxos_bgp.disable_policy_batching_ipv6_prefix_list
  disable_policy_batching_nexthop          = local.nxos_bgp.disable_policy_batching_nexthop
  enhanced_error_handling                  = local.nxos_bgp.enhanced_error_handling
  fabric_soo                               = local.nxos_bgp.fabric_soo
  flush_routes                             = local.nxos_bgp.flush_routes
  instance_admin_state                     = local.nxos_bgp.instance_admin_state
  isolate                                  = local.nxos_bgp.isolate
  isolate_route_map                        = local.nxos_bgp.isolate_route_map
  med_dampening_interval                   = local.nxos_bgp.med_dampening_interval
  mvpn_vri_id                              = local.nxos_bgp.mvpn_vri_id
  nexthop_suppress_default_resolution      = local.nxos_bgp.nexthop_suppress_default_resolution
  rd_dual                                  = local.nxos_bgp.rd_dual
  rd_dual_id                               = local.nxos_bgp.rd_dual_id
  vrfs                                     = local.nxos_bgp.vrfs
}
