# 108 · data source fmc_ikev2_policy · 2. Objects
# This data source reads the IKEv2 Policy.
# Reads models/data_fmc_ikev2_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_108 = yamldecode(file("${path.module}/../models/data_fmc_ikev2_policy.yml"))["data_fmc_ikev2_policy"]
}

data "fmc_ikev2_policy" "n108" {
  domain = local.m_108["domain"]
  id     = local.m_108["id"]
  name   = local.m_108["name"]
}

output "n108_data_fmc_ikev2_policy_id" {
  value = data.fmc_ikev2_policy.n108.id
}
