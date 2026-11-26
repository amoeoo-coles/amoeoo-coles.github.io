# 108 · data source catalystcenter_network_profile_for_sites_assignments · 6. Templates, profiles and LAN automation
# This data source can read the Network Profile for Sites Assignments.
# Reads models/data_catalystcenter_network_profile_for_sites_assignments.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_108 = yamldecode(file("${path.module}/../models/data_catalystcenter_network_profile_for_sites_assignments.yml"))["data_catalystcenter_network_profile_for_sites_assignments"]
}

data "catalystcenter_network_profile_for_sites_assignments" "n108" {
  network_profile_id = local.m_108["network_profile_id"]
}

output "n108_data_catalystcenter_network_profile_for_sites_assignments_id" {
  value = data.catalystcenter_network_profile_for_sites_assignments.n108.id
}
