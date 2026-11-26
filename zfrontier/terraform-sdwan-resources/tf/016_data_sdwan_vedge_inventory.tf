# 016 · data source sdwan_vedge_inventory · 2. Network hierarchy and inventory
# This data source can read the VEdge Inventory .
# Reads models/data_sdwan_vedge_inventory.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_016 = yamldecode(file("${path.module}/../models/data_sdwan_vedge_inventory.yml"))["data_sdwan_vedge_inventory"]
}

data "sdwan_vedge_inventory" "n016" {
}

output "n016_data_sdwan_vedge_inventory_id" {
  value = data.sdwan_vedge_inventory.n016.id
}
