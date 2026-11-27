tenant        = "flood_lab"
vrf           = "flood_lab_vrf"
manage_tenant = true

scenarios = {
  "multicast-app" = {
    bd                                 = "bd_multicast_app"
    description                        = "Multicast application BD"
    unicast_routing                    = "yes"
    l2_unknown_unicast_flooding        = "proxy"
    l3_unknown_multicast_flooding      = "opt-flood"
    ipv6_l3_unknown_multicast_flooding = "opt-flood"
    multi_destination_flooding         = "bd-flood"
    arp_flooding                       = "no"
    pim                                = "yes"
    clear_remote_mac_entries           = "no"
    endpoint_move_detection_mode       = ""
    subnet                             = "10.10.60.1/24"
  }
}
