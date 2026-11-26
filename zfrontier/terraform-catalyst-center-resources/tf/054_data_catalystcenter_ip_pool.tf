# 054 · data source catalystcenter_ip_pool · 3. Network settings and tags
# This data source can read the IP Pool.
# Reads models/data_catalystcenter_ip_pool.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_054 = yamldecode(file("${path.module}/../models/data_catalystcenter_ip_pool.yml"))["data_catalystcenter_ip_pool"]
}

data "catalystcenter_ip_pool" "n054" {
  id = local.m_054["id"]
}

output "n054_data_catalystcenter_ip_pool_id" {
  value = data.catalystcenter_ip_pool.n054.id
}
