# 009 · data source ise_active_directory_join_point · 2. Identity management
# This data source can read the Active Directory Join Point.
# Reads models/data_ise_active_directory_join_point.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_009 = yamldecode(file("${path.module}/../models/data_ise_active_directory_join_point.yml"))["data_ise_active_directory_join_point"]
}

data "ise_active_directory_join_point" "n009" {
  id = local.m_009["id"]
}

output "n009_data_ise_active_directory_join_point_id" {
  value = data.ise_active_directory_join_point.n009.id
}
