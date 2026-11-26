# 118 · data source sdwan_sig_security_feature_profile · 4. Feature profiles
# This data source can read the SIG Security Feature Profile .
# Reads models/data_sdwan_sig_security_feature_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_118 = yamldecode(file("${path.module}/../models/data_sdwan_sig_security_feature_profile.yml"))["data_sdwan_sig_security_feature_profile"]
}

data "sdwan_sig_security_feature_profile" "n118" {
  id   = local.m_118["id"]
  name = local.m_118["name"]
}

output "n118_data_sdwan_sig_security_feature_profile_id" {
  value = data.sdwan_sig_security_feature_profile.n118.id
}
