# 019 nxos_route_policy — 4. VRFs and L3VNI
# Provider CiscoDevNet/nxos 0.22.3. Docs: https://registry.terraform.io/providers/CiscoDevNet/nxos/0.22.3/docs/resources/route_policy
# Reads ../models/nxos_route_policy.yml (yamldecode). Edit the model, not this file.

locals {
  nxos_route_policy = yamldecode(file("${path.module}/../models/nxos_route_policy.yml"))["nxos_route_policy"]
}

resource "nxos_route_policy" "this" {
  admin_state              = local.nxos_route_policy.admin_state
  as_path_access_lists     = local.nxos_route_policy.as_path_access_lists
  community_lists          = local.nxos_route_policy.community_lists
  deletion_policy          = local.nxos_route_policy.deletion_policy
  device                   = local.nxos_route_policy.device
  extended_community_lists = local.nxos_route_policy.extended_community_lists
  ipv4_policy_interfaces   = local.nxos_route_policy.ipv4_policy_interfaces
  ipv4_prefix_lists        = local.nxos_route_policy.ipv4_prefix_lists
  ipv6_policy_interfaces   = local.nxos_route_policy.ipv6_policy_interfaces
  ipv6_prefix_lists        = local.nxos_route_policy.ipv6_prefix_lists
  large_community_lists    = local.nxos_route_policy.large_community_lists
  route_maps               = local.nxos_route_policy.route_maps
}
