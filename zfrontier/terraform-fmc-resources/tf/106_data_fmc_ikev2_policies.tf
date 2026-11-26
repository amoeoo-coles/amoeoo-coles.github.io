# 106 · data source fmc_ikev2_policies · 2. Objects
# This data source reads the IKEv2 Policies.
# Reads models/data_fmc_ikev2_policies.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_106 = yamldecode(file("${path.module}/../models/data_fmc_ikev2_policies.yml"))["data_fmc_ikev2_policies"]
}

data "fmc_ikev2_policies" "n106" {
  domain = local.m_106["domain"]
  items  = local.m_106["items"]
}

output "n106_data_fmc_ikev2_policies_id" {
  value = data.fmc_ikev2_policies.n106.id
}
