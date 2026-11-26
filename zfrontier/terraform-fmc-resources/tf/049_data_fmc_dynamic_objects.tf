# 049 · data source fmc_dynamic_objects · 2. Objects
# This data source reads the Dynamic Objects.
# Reads models/data_fmc_dynamic_objects.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_049 = yamldecode(file("${path.module}/../models/data_fmc_dynamic_objects.yml"))["data_fmc_dynamic_objects"]
}

data "fmc_dynamic_objects" "n049" {
  domain = local.m_049["domain"]
  items  = local.m_049["items"]
}

output "n049_data_fmc_dynamic_objects_id" {
  value = data.fmc_dynamic_objects.n049.id
}
