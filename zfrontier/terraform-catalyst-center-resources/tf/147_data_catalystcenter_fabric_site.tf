# 147 · data source catalystcenter_fabric_site · 7. SD-Access
# This data source can read the Fabric Site.
# Reads models/data_catalystcenter_fabric_site.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_147 = yamldecode(file("${path.module}/../models/data_catalystcenter_fabric_site.yml"))["data_catalystcenter_fabric_site"]
}

data "catalystcenter_fabric_site" "n147" {
  id = local.m_147["id"]
  site_id = local.m_147["site_id"]
}

output "n147_data_catalystcenter_fabric_site_id" {
  value = data.catalystcenter_fabric_site.n147.id
}
