# 345 · data source sdwan_embedded_security_policy · 9. Configuration, policy and topology groups
# This data source can read the Embedded Security Policy.
# Reads models/data_sdwan_embedded_security_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_345 = yamldecode(file("${path.module}/../models/data_sdwan_embedded_security_policy.yml"))["data_sdwan_embedded_security_policy"]
}

data "sdwan_embedded_security_policy" "n345" {
  feature_profile_id = local.m_345["feature_profile_id"]
  id = local.m_345["id"]
  name = local.m_345["name"]
}

output "n345_data_sdwan_embedded_security_policy_id" {
  value = data.sdwan_embedded_security_policy.n345.id
}
