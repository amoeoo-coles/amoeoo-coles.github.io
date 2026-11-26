# 032 · data source catalystcenter_assign_credentials · 3. Network settings and tags
# This data source can read the assigned credentials of a site.
# Reads models/data_catalystcenter_assign_credentials.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_032 = yamldecode(file("${path.module}/../models/data_catalystcenter_assign_credentials.yml"))["data_catalystcenter_assign_credentials"]
}

data "catalystcenter_assign_credentials" "n032" {
  id      = local.m_032["id"]
  site_id = local.m_032["site_id"]
}

output "n032_data_catalystcenter_assign_credentials_id" {
  value = data.catalystcenter_assign_credentials.n032.id
}
