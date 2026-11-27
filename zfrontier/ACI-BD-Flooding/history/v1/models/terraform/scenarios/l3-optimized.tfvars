tenant        = "flood_lab"
vrf           = "flood_lab_vrf"
manage_tenant = true

scenarios = {
  "l3-optimized" = {
    bd                                 = "bd_l3_optimized"
    description                        = "L3 BD, default Optimize"
    unicast_routing                    = "yes"
    l2_unknown_unicast_flooding        = "proxy"
    l3_unknown_multicast_flooding      = "flood"
    ipv6_l3_unknown_multicast_flooding = "flood"
    multi_destination_flooding         = "bd-flood"
    arp_flooding                       = "no"
    pim                                = "no"
    clear_remote_mac_entries           = "no"
    endpoint_move_detection_mode       = ""
    subnet                             = "10.10.10.1/24"
  }
}
