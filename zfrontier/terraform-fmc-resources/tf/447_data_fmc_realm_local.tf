# 447 · data source fmc_realm_local · 6. Integrations
# This data source reads the Realm Local.
# Reads models/data_fmc_realm_local.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_447 = yamldecode(file("${path.module}/../models/data_fmc_realm_local.yml"))["data_fmc_realm_local"]
}

data "fmc_realm_local" "n447" {
  domain = local.m_447["domain"]
  id     = local.m_447["id"]
  name   = local.m_447["name"]
}

output "n447_data_fmc_realm_local_id" {
  value = data.fmc_realm_local.n447.id
}
