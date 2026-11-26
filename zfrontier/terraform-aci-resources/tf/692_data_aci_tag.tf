# 692 · data source aci_tag · 8. Operational and utility
# Data source for ACI Tag
# APIC class: tagTag · DN: not collected
# Reads models/data_aci_tag.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_692 = yamldecode(file("${path.module}/../models/data_aci_tag.yml"))["data_aci_tag"]
}

data "aci_tag" "n692" {
  key       = local.m_692["key"]
  parent_dn = local.m_692["parent_dn"]
}

output "n692_data_aci_tag_id" {
  value = data.aci_tag.n692.id
}
