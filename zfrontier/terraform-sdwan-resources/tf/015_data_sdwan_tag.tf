# 015 · data source sdwan_tag · 2. Network hierarchy and inventory
# This data source can read the Tag .
# Reads models/data_sdwan_tag.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_015 = yamldecode(file("${path.module}/../models/data_sdwan_tag.yml"))["data_sdwan_tag"]
}

data "sdwan_tag" "n015" {
  id = local.m_015["id"]
}

output "n015_data_sdwan_tag_id" {
  value = data.sdwan_tag.n015.id
}
