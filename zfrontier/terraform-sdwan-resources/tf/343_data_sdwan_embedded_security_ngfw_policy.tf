# 343 · data source sdwan_embedded_security_ngfw_policy · 9. Configuration, policy and topology groups
# This data source can read the Embedded Security NGFW Policy.
# Reads models/data_sdwan_embedded_security_ngfw_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_343 = yamldecode(file("${path.module}/../models/data_sdwan_embedded_security_ngfw_policy.yml"))["data_sdwan_embedded_security_ngfw_policy"]
}

data "sdwan_embedded_security_ngfw_policy" "n343" {
  feature_profile_id = local.m_343["feature_profile_id"]
  id                 = local.m_343["id"]
  name               = local.m_343["name"]
}

output "n343_data_sdwan_embedded_security_ngfw_policy_id" {
  value = data.sdwan_embedded_security_ngfw_policy.n343.id
}
