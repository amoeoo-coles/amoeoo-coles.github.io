# 148 · data source catalystcenter_fabric_sites · 7. SD-Access
# This data source fetches all fabric sites defined on the Catalyst Center. To retrieve detailed information about a specific site, use the data source data.catalystcenter_fabric_site.
# Reads models/data_catalystcenter_fabric_sites.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_148 = yamldecode(file("${path.module}/../models/data_catalystcenter_fabric_sites.yml"))["data_catalystcenter_fabric_sites"]
}

data "catalystcenter_fabric_sites" "n148" {
}
