# 136 · resource catalystcenter_fabric_multicast_replication_mode · 7. SD-Access
# This resource can manage a Fabric Multicast Replication Mode.
# Reads models/catalystcenter_fabric_multicast_replication_mode.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_136 = yamldecode(file("${path.module}/../models/catalystcenter_fabric_multicast_replication_mode.yml"))["catalystcenter_fabric_multicast_replication_mode"]
}

resource "catalystcenter_fabric_multicast_replication_mode" "n136" {
  fabric_id        = local.m_136["fabric_id"]
  replication_mode = local.m_136["replication_mode"]
}
