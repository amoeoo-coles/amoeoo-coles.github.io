# 063 · data source catalystcenter_sp_profile · 3. Network settings and tags
# This data source can read the SP Profile.
# Reads models/data_catalystcenter_sp_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_063 = yamldecode(file("${path.module}/../models/data_catalystcenter_sp_profile.yml"))["data_catalystcenter_sp_profile"]
}

data "catalystcenter_sp_profile" "n063" {
  id = local.m_063["id"]
}

output "n063_data_catalystcenter_sp_profile_id" {
  value = data.catalystcenter_sp_profile.n063.id
}
