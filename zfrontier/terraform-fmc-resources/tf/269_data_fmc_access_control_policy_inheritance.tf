# 269 · data source fmc_access_control_policy_inheritance · 3. Policies
# This data source reads the Access Control Policy Inheritance.
# Reads models/data_fmc_access_control_policy_inheritance.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_269 = yamldecode(file("${path.module}/../models/data_fmc_access_control_policy_inheritance.yml"))["data_fmc_access_control_policy_inheritance"]
}

data "fmc_access_control_policy_inheritance" "n269" {
  access_control_policy_id = local.m_269["access_control_policy_id"]
  domain = local.m_269["domain"]
  id = local.m_269["id"]
}

output "n269_data_fmc_access_control_policy_inheritance_id" {
  value = data.fmc_access_control_policy_inheritance.n269.id
}
