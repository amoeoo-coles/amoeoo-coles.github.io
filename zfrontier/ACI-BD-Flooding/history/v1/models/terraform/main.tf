# Parametric flood_lab tenant: one aci_bridge_domain per scenarios map entry.
# Attribute names are the current CiscoDevNet/aci Plugin Framework names,
# checked against the registry docs for aci_bridge_domain (latest as of
# 26 Nov 2026): parent_dn, unicast_routing, l2_unknown_unicast_flooding,
# l3_unknown_multicast_flooding, ipv6_l3_unknown_multicast_flooding,
# multi_destination_flooding, arp_flooding, pim, relation_to_vrf.vrf_name.

resource "aci_tenant" "lab" {
  count       = var.manage_tenant ? 1 : 0
  name        = var.tenant
  description = "zFrontier flood_lab — BD flooding scenarios"
}

resource "aci_vrf" "lab" {
  count       = var.manage_tenant ? 1 : 0
  parent_dn   = aci_tenant.lab[0].id
  name        = var.vrf
  description = "zFrontier flood_lab VRF"
}

locals {
  tenant_dn = var.manage_tenant ? aci_tenant.lab[0].id : "uni/tn-${var.tenant}"
  vrf_name  = var.vrf
}

resource "aci_bridge_domain" "this" {
  for_each = var.scenarios

  parent_dn                          = local.tenant_dn
  name                               = each.value.bd
  description                        = each.value.description
  unicast_routing                    = each.value.unicast_routing
  l2_unknown_unicast_flooding        = each.value.l2_unknown_unicast_flooding
  l3_unknown_multicast_flooding      = each.value.l3_unknown_multicast_flooding
  ipv6_l3_unknown_multicast_flooding = each.value.ipv6_l3_unknown_multicast_flooding
  multi_destination_flooding         = each.value.multi_destination_flooding
  arp_flooding                       = each.value.arp_flooding
  pim                                = each.value.pim
  clear_remote_mac_entries           = each.value.clear_remote_mac_entries
  endpoint_move_detection_mode       = each.value.endpoint_move_detection_mode
  relation_to_vrf = {
    vrf_name = local.vrf_name
  }

  depends_on = [aci_vrf.lab]
}

# Current provider resource is aci_subnet with parent_dn pointing at the BD.
resource "aci_subnet" "this" {
  for_each = {
    for k, s in var.scenarios : k => s
    if try(s.subnet, null) != null && try(s.subnet, "") != ""
  }

  parent_dn = aci_bridge_domain.this[each.key].id
  ip        = each.value.subnet
  scope     = ["private"]
}
