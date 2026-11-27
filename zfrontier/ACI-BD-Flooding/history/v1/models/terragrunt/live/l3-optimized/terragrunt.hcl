include "root" {
  path = find_in_parent_folders("root.hcl")
}

# Scenario: l3-optimized (bd_l3_optimized) — L3 BD, default Optimize
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
  }
}
