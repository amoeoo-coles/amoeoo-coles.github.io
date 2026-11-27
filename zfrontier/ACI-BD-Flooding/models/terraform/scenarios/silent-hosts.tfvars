tenant        = "flood_lab"
vrf           = "flood_lab_vrf"
manage_tenant = true

scenarios = {
  "silent-hosts" = {
    bd                                 = "bd_silent_hosts"
    description                        = "Silent-host BD (L2 reachability)"
    unicast_routing                    = "yes"
    l2_unknown_unicast_flooding        = "flood"
    l3_unknown_multicast_flooding      = "flood"
    ipv6_l3_unknown_multicast_flooding = "flood"
    multi_destination_flooding         = "bd-flood"
    arp_flooding                       = "yes"
    pim                                = "no"
    clear_remote_mac_entries           = "yes"
    endpoint_move_detection_mode       = ""
    subnet                             = "10.10.30.1/24"
  }
}
