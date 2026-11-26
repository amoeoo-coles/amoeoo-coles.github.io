# 005 · data source mso_role · 1. Platform, identity and sites
# Data source for MSO Role.
# Class: not collected · DN: not collected
# Reads models/data_mso_role.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_005 = yamldecode(file("${path.module}/../models/data_mso_role.yml"))["data_mso_role"]
}

data "mso_role" "n005" {
  name = local.m_005["name"]
}

output "n005_data_mso_role_id" {
  value = data.mso_role.n005.id
}
