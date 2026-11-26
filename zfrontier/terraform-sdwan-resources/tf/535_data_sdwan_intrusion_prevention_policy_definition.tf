# 535 · data source sdwan_intrusion_prevention_policy_definition · 13. (Classic) localized, centralized and security policies
# This data source can read the Intrusion Prevention Policy Definition .
# Reads models/data_sdwan_intrusion_prevention_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_535 = yamldecode(file("${path.module}/../models/data_sdwan_intrusion_prevention_policy_definition.yml"))["data_sdwan_intrusion_prevention_policy_definition"]
}

data "sdwan_intrusion_prevention_policy_definition" "n535" {
  id = local.m_535["id"]
}

output "n535_data_sdwan_intrusion_prevention_policy_definition_id" {
  value = data.sdwan_intrusion_prevention_policy_definition.n535.id
}
