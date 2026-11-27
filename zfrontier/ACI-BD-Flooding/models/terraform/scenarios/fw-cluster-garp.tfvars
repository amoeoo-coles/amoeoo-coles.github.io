tenant        = "flood_lab"
vrf           = "flood_lab_vrf"
manage_tenant = true

scenarios = {
  "fw-cluster-garp" = {
    bd                                 = "bd_fw_cluster"
    description                        = "Firewall / load-balancer cluster (GARP)"
    unicast_routing                    = "yes"
    l2_unknown_unicast_flooding        = "proxy"
    l3_unknown_multicast_flooding      = "flood"
    ipv6_l3_unknown_multicast_flooding = "flood"
    multi_destination_flooding         = "bd-flood"
    arp_flooding                       = "yes"
    pim                                = "no"
    clear_remote_mac_entries           = "no"
    endpoint_move_detection_mode       = "garp"
    subnet                             = "10.10.70.1/24"
  }
}
