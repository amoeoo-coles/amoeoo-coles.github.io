include "root" {
  path = find_in_parent_folders("root.hcl")
}

# Scenario: fw-cluster-garp (bd_fw_cluster) — Firewall / load-balancer cluster (GARP)
# This unit also creates the flood_lab tenant and VRF (manage_tenant = true).
# Apply only one "manage_tenant = true" unit at a time to the same APIC, or
# use the all/ unit. Re-running a second unit is safe if the tenant already
# exists (Terraform will import-or-adopt only the objects in its state).

inputs = {
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
}
