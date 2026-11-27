include "root" {
  path = find_in_parent_folders("root.hcl")
}

# Scenario: l2-migration (bd_l2_migration) — L2 stretched / legacy migration BD
# This unit also creates the flood_lab tenant and VRF (manage_tenant = true).
# Apply only one "manage_tenant = true" unit at a time to the same APIC, or
# use the all/ unit. Re-running a second unit is safe if the tenant already
# exists (Terraform will import-or-adopt only the objects in its state).

inputs = {
  manage_tenant = true

  scenarios = {
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
  }
}
