# 009 · data source catalystcenter_role · 1. System
# This data source can read the Role.
# Reads models/data_catalystcenter_role.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_009 = yamldecode(file("${path.module}/../models/data_catalystcenter_role.yml"))["data_catalystcenter_role"]
}

data "catalystcenter_role" "n009" {
  id = local.m_009["id"]
  name = local.m_009["name"]
}

output "n009_data_catalystcenter_role_id" {
  value = data.catalystcenter_role.n009.id
}
