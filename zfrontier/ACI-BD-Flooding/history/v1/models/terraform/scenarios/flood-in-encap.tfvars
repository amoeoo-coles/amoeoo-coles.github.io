tenant        = "flood_lab"
vrf           = "flood_lab_vrf"
manage_tenant = true

scenarios = {
  "flood-in-encap" = {
    bd                                 = "bd_flood_in_encap"
    description                        = "Flood in Encapsulation (VLAN-per-EPG shared BD)"
    unicast_routing                    = "yes"
    l2_unknown_unicast_flooding        = "flood"
    l3_unknown_multicast_flooding      = "flood"
    ipv6_l3_unknown_multicast_flooding = "flood"
    multi_destination_flooding         = "encap-flood"
    arp_flooding                       = "yes"
    pim                                = "no"
    clear_remote_mac_entries           = "yes"
    endpoint_move_detection_mode       = ""
    subnet                             = "10.10.40.1/24"
  }
}
