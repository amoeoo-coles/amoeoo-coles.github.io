# 060 · data source sdwan_policy_object_security_ips_signature_set · 3. Policy objects and custom applications
# This data source can read the Policy Object Security IPS Signature Set Policy_object.
# Reads models/data_sdwan_policy_object_security_ips_signature_set.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_060 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_security_ips_signature_set.yml"))["data_sdwan_policy_object_security_ips_signature_set"]
}

data "sdwan_policy_object_security_ips_signature_set" "n060" {
  feature_profile_id = local.m_060["feature_profile_id"]
  id = local.m_060["id"]
  name = local.m_060["name"]
}

output "n060_data_sdwan_policy_object_security_ips_signature_set_id" {
  value = data.sdwan_policy_object_security_ips_signature_set.n060.id
}
