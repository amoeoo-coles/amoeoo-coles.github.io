# 058 · data source sdwan_policy_object_security_ips_signature · 3. Policy objects and custom applications
# This data source can read the Policy Object Security IPS Signature Policy_object.
# Reads models/data_sdwan_policy_object_security_ips_signature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_058 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_security_ips_signature.yml"))["data_sdwan_policy_object_security_ips_signature"]
}

data "sdwan_policy_object_security_ips_signature" "n058" {
  feature_profile_id = local.m_058["feature_profile_id"]
  id = local.m_058["id"]
  name = local.m_058["name"]
}

output "n058_data_sdwan_policy_object_security_ips_signature_id" {
  value = data.sdwan_policy_object_security_ips_signature.n058.id
}
