# 070 · data source fmc_fqdn_overrides · 2. Objects
# This data source reads the FQDN Overrides.
# Reads models/data_fmc_fqdn_overrides.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_070 = yamldecode(file("${path.module}/../models/data_fmc_fqdn_overrides.yml"))["data_fmc_fqdn_overrides"]
}

data "fmc_fqdn_overrides" "n070" {
  domain = local.m_070["domain"]
  id = local.m_070["id"]
  parent_name = local.m_070["parent_name"]
}

output "n070_data_fmc_fqdn_overrides_id" {
  value = data.fmc_fqdn_overrides.n070.id
}
