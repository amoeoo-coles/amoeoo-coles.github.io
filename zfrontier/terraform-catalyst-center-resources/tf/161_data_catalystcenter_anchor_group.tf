# 161 · data source catalystcenter_anchor_group · 8. Wireless
# This data source can read the Anchor Group.
# Reads models/data_catalystcenter_anchor_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_161 = yamldecode(file("${path.module}/../models/data_catalystcenter_anchor_group.yml"))["data_catalystcenter_anchor_group"]
}

data "catalystcenter_anchor_group" "n161" {
  id = local.m_161["id"]
}

output "n161_data_catalystcenter_anchor_group_id" {
  value = data.catalystcenter_anchor_group.n161.id
}
