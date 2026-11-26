# 027 · data source catalystcenter_site · 2. Sites
# This data source fetches site based on name hierarchy
# Reads models/data_catalystcenter_site.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_027 = yamldecode(file("${path.module}/../models/data_catalystcenter_site.yml"))["data_catalystcenter_site"]
}

data "catalystcenter_site" "n027" {
  name_hierarchy = local.m_027["name_hierarchy"]
}

output "n027_data_catalystcenter_site_id" {
  value = data.catalystcenter_site.n027.id
}
