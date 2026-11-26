# 304 · data source fmc_prefilter_policy · 3. Policies
# This data source reads the Prefilter Policy.
# Reads models/data_fmc_prefilter_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_304 = yamldecode(file("${path.module}/../models/data_fmc_prefilter_policy.yml"))["data_fmc_prefilter_policy"]
}

data "fmc_prefilter_policy" "n304" {
  domain = local.m_304["domain"]
  id = local.m_304["id"]
  name = local.m_304["name"]
}

output "n304_data_fmc_prefilter_policy_id" {
  value = data.fmc_prefilter_policy.n304.id
}
