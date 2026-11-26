# 098 · data source fmc_ikev1_policies · 2. Objects
# This data source reads the IKEv1 Policies.
# Reads models/data_fmc_ikev1_policies.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_098 = yamldecode(file("${path.module}/../models/data_fmc_ikev1_policies.yml"))["data_fmc_ikev1_policies"]
}

data "fmc_ikev1_policies" "n098" {
  domain = local.m_098["domain"]
  items  = local.m_098["items"]
}

output "n098_data_fmc_ikev1_policies_id" {
  value = data.fmc_ikev1_policies.n098.id
}
