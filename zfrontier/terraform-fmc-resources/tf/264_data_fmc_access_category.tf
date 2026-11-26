# 264 · data source fmc_access_category · 3. Policies
# This data source reads the Access Category.
# Reads models/data_fmc_access_category.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_264 = yamldecode(file("${path.module}/../models/data_fmc_access_category.yml"))["data_fmc_access_category"]
}

data "fmc_access_category" "n264" {
  access_control_policy_id = local.m_264["access_control_policy_id"]
  domain                   = local.m_264["domain"]
  id                       = local.m_264["id"]
  name                     = local.m_264["name"]
}

output "n264_data_fmc_access_category_id" {
  value = data.fmc_access_category.n264.id
}
