# 074 · data source catalystcenter_tag · 3. Network settings and tags
# This data source can read the Tag.
# Reads models/data_catalystcenter_tag.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_074 = yamldecode(file("${path.module}/../models/data_catalystcenter_tag.yml"))["data_catalystcenter_tag"]
}

data "catalystcenter_tag" "n074" {
  name = local.m_074["name"]
}

output "n074_data_catalystcenter_tag_id" {
  value = data.catalystcenter_tag.n074.id
}
