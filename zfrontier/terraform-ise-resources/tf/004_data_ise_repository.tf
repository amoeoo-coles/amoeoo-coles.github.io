# 004 · data source ise_repository · 1. System
# This data source can read the Repository.
# Reads models/data_ise_repository.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_004 = yamldecode(file("${path.module}/../models/data_ise_repository.yml"))["data_ise_repository"]
}

data "ise_repository" "n004" {
  id   = local.m_004["id"]
  name = local.m_004["name"]
}

output "n004_data_ise_repository_id" {
  value = data.ise_repository.n004.id
}
