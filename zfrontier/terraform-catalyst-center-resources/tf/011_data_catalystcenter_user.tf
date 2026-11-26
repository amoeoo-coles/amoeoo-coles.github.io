# 011 · data source catalystcenter_user · 1. System
# This data source can read the User.
# Reads models/data_catalystcenter_user.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_011 = yamldecode(file("${path.module}/../models/data_catalystcenter_user.yml"))["data_catalystcenter_user"]
}

data "catalystcenter_user" "n011" {
  id = local.m_011["id"]
}

output "n011_data_catalystcenter_user_id" {
  value = data.catalystcenter_user.n011.id
}
