# 268 · resource fmc_access_control_policy_inheritance · 3. Policies
# This resource manages an Access Control Policy Inheritance.
# Reads models/fmc_access_control_policy_inheritance.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_268 = yamldecode(file("${path.module}/../models/fmc_access_control_policy_inheritance.yml"))["fmc_access_control_policy_inheritance"]
}

resource "fmc_access_control_policy_inheritance" "n268" {
  access_control_policy_id      = local.m_268["access_control_policy_id"]
  base_access_control_policy_id = local.m_268["base_access_control_policy_id"]
  domain                        = local.m_268["domain"]
}
