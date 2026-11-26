# 137 · data source catalystcenter_fabric_multicast_replication_mode · 7. SD-Access
# This data source can read the Fabric Multicast Replication Mode.
# Reads models/data_catalystcenter_fabric_multicast_replication_mode.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_137 = yamldecode(file("${path.module}/../models/data_catalystcenter_fabric_multicast_replication_mode.yml"))["data_catalystcenter_fabric_multicast_replication_mode"]
}

data "catalystcenter_fabric_multicast_replication_mode" "n137" {
  fabric_id = local.m_137["fabric_id"]
  id        = local.m_137["id"]
}

output "n137_data_catalystcenter_fabric_multicast_replication_mode_id" {
  value = data.catalystcenter_fabric_multicast_replication_mode.n137.id
}
