# 167 · data source fmc_radius_server_group · 2. Objects
# This data source reads the Radius Server Group.
# Reads models/data_fmc_radius_server_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_167 = yamldecode(file("${path.module}/../models/data_fmc_radius_server_group.yml"))["data_fmc_radius_server_group"]
}

data "fmc_radius_server_group" "n167" {
  domain = local.m_167["domain"]
  id = local.m_167["id"]
  name = local.m_167["name"]
}

output "n167_data_fmc_radius_server_group_id" {
  value = data.fmc_radius_server_group.n167.id
}
