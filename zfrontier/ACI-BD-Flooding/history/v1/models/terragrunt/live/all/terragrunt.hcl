include "root" {
  path = find_in_parent_folders("root.hcl")
}

# All eight flooding scenarios in one unit.
# This unit also creates the flood_lab tenant and VRF (manage_tenant = true).
# Apply only one "manage_tenant = true" unit at a time to the same APIC, or
# use the all/ unit. Re-running a second unit is safe if the tenant already
# exists (Terraform will import-or-adopt only the objects in its state).

inputs = {
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
    "l2-migration" = {
      bd                                 = "bd_l2_migration"
      description                        = "L2 stretched / legacy migration BD"
      unicast_routing                    = "yes"
      l2_unknown_unicast_flooding        = "flood"
      l3_unknown_multicast_flooding      = "flood"
      ipv6_l3_unknown_multicast_flooding = "flood"
      multi_destination_flooding         = "bd-flood"
      arp_flooding                       = "yes"
      pim                                = "no"
      clear_remote_mac_entries           = "yes"
      endpoint_move_detection_mode       = ""
      subnet                             = "10.10.20.1/24"
    }
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
    "drop-bum" = {
      bd                                 = "bd_drop_bum"
      description                        = "Drop multi-destination (security)"
      unicast_routing                    = "yes"
      l2_unknown_unicast_flooding        = "proxy"
      l3_unknown_multicast_flooding      = "flood"
      ipv6_l3_unknown_multicast_flooding = "flood"
      multi_destination_flooding         = "drop"
      arp_flooding                       = "no"
      pim                                = "no"
      clear_remote_mac_entries           = "no"
      endpoint_move_detection_mode       = ""
      subnet                             = "10.10.50.1/24"
    }
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
}
