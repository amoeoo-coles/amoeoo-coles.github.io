tenant        = "flood_lab"
vrf           = "flood_lab_vrf"
manage_tenant = true

scenarios = {
  "l2-only" = {
    bd                                 = "bd_l2_only"
    description                        = "L2-only BD (unicast routing off)"
    unicast_routing                    = "no"
    l2_unknown_unicast_flooding        = "flood"
    l3_unknown_multicast_flooding      = "flood"
    ipv6_l3_unknown_multicast_flooding = "flood"
    multi_destination_flooding         = "bd-flood"
    arp_flooding                       = "yes"
    pim                                = "no"
    clear_remote_mac_entries           = "yes"
    endpoint_move_detection_mode       = ""
  }
}
