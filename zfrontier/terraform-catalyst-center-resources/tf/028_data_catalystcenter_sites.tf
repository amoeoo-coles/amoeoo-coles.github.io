# 028 · data source catalystcenter_sites · 2. Sites
# This data source fetches all sites defined on the Catalyst Center. Sites represent the logical and physical hierarchy of your network environment, including areas, buildings, and floors. You can optionally specify the type attribute to filter the results and retrieve only sites of a specific type—
# Reads models/data_catalystcenter_sites.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_028 = yamldecode(file("${path.module}/../models/data_catalystcenter_sites.yml"))["data_catalystcenter_sites"]
}

data "catalystcenter_sites" "n028" {
  type = local.m_028["type"]
}
