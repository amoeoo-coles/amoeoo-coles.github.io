resource "nxos_feature" "ipn" {
  ospf           = "enabled"
  pim            = "enabled"
  interface_vlan = "enabled"
  dhcp           = "enabled"
}

resource "nxos_vrf" "ipn" {
  vrfs = {
    (var.wan_vrf) = {
      description = "Example IPN/ISN VRF (${var.environment})"
    }
  }
}
