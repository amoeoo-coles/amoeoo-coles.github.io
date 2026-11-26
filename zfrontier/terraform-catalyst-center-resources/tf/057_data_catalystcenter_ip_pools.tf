# 057 · data source catalystcenter_ip_pools · 3. Network settings and tags
# This data source fetches all global ip pools defined on the Catalyst Center. To retrieve detailed information about a specific pool, use the data source data.catalystcenter_ip_pool.
# Reads models/data_catalystcenter_ip_pools.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_057 = yamldecode(file("${path.module}/../models/data_catalystcenter_ip_pools.yml"))["data_catalystcenter_ip_pools"]
}

data "catalystcenter_ip_pools" "n057" {
}
