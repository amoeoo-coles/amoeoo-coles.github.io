# 254 · data source fmc_variable_set · 2. Objects
# This data source reads the Variable Set.
# Reads models/data_fmc_variable_set.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_254 = yamldecode(file("${path.module}/../models/data_fmc_variable_set.yml"))["data_fmc_variable_set"]
}

data "fmc_variable_set" "n254" {
  domain = local.m_254["domain"]
  id     = local.m_254["id"]
  name   = local.m_254["name"]
}

output "n254_data_fmc_variable_set_id" {
  value = data.fmc_variable_set.n254.id
}
