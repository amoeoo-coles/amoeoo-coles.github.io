# 107 · resource catalystcenter_network_profile_for_sites_assignments · 6. Templates, profiles and LAN automation
# Manages Network Profile for Site Assignments
# Reads models/catalystcenter_network_profile_for_sites_assignments.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_107 = yamldecode(file("${path.module}/../models/catalystcenter_network_profile_for_sites_assignments.yml"))["catalystcenter_network_profile_for_sites_assignments"]
}

resource "catalystcenter_network_profile_for_sites_assignments" "n107" {
  items              = local.m_107["items"]
  network_profile_id = local.m_107["network_profile_id"]
}
