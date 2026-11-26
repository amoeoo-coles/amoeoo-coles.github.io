# 150 · data source catalystcenter_fabric_zone · 7. SD-Access
# This data source can read the Fabric Zone.
# Reads models/data_catalystcenter_fabric_zone.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_150 = yamldecode(file("${path.module}/../models/data_catalystcenter_fabric_zone.yml"))["data_catalystcenter_fabric_zone"]
}

data "catalystcenter_fabric_zone" "n150" {
  site_id = local.m_150["site_id"]
}

output "n150_data_catalystcenter_fabric_zone_id" {
  value = data.catalystcenter_fabric_zone.n150.id
}
