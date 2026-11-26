# 004 · data source sdwan_scope · 1. Settings, users and access
# This data source can read the Scope .
# Reads models/data_sdwan_scope.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_004 = yamldecode(file("${path.module}/../models/data_sdwan_scope.yml"))["data_sdwan_scope"]
}

data "sdwan_scope" "n004" {
  id = local.m_004["id"]
}

output "n004_data_sdwan_scope_id" {
  value = data.sdwan_scope.n004.id
}
