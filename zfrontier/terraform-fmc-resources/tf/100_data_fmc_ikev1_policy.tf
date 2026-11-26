# 100 · data source fmc_ikev1_policy · 2. Objects
# This data source reads the IKEv1 Policy.
# Reads models/data_fmc_ikev1_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_100 = yamldecode(file("${path.module}/../models/data_fmc_ikev1_policy.yml"))["data_fmc_ikev1_policy"]
}

data "fmc_ikev1_policy" "n100" {
  domain = local.m_100["domain"]
  id     = local.m_100["id"]
  name   = local.m_100["name"]
}

output "n100_data_fmc_ikev1_policy_id" {
  value = data.fmc_ikev1_policy.n100.id
}
