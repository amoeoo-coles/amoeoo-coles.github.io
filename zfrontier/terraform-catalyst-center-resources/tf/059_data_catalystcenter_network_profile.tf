# 059 · data source catalystcenter_network_profile · 3. Network settings and tags
# This data source can read the Network Profile.
# Reads models/data_catalystcenter_network_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_059 = yamldecode(file("${path.module}/../models/data_catalystcenter_network_profile.yml"))["data_catalystcenter_network_profile"]
}

data "catalystcenter_network_profile" "n059" {
  id = local.m_059["id"]
  name = local.m_059["name"]
}

output "n059_data_catalystcenter_network_profile_id" {
  value = data.catalystcenter_network_profile.n059.id
}
