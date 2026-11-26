# 056 · data source catalystcenter_ip_pool_reservation · 3. Network settings and tags
# This data source can read the IP Pool Reservation.
# Reads models/data_catalystcenter_ip_pool_reservation.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_056 = yamldecode(file("${path.module}/../models/data_catalystcenter_ip_pool_reservation.yml"))["data_catalystcenter_ip_pool_reservation"]
}

data "catalystcenter_ip_pool_reservation" "n056" {
  id = local.m_056["id"]
}

output "n056_data_catalystcenter_ip_pool_reservation_id" {
  value = data.catalystcenter_ip_pool_reservation.n056.id
}
