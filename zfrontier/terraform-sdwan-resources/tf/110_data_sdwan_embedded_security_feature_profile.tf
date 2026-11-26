# 110 · data source sdwan_embedded_security_feature_profile · 4. Feature profiles
# This data source can read the Embedded Security Feature Profile .
# Reads models/data_sdwan_embedded_security_feature_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_110 = yamldecode(file("${path.module}/../models/data_sdwan_embedded_security_feature_profile.yml"))["data_sdwan_embedded_security_feature_profile"]
}

data "sdwan_embedded_security_feature_profile" "n110" {
  id   = local.m_110["id"]
  name = local.m_110["name"]
}

output "n110_data_sdwan_embedded_security_feature_profile_id" {
  value = data.sdwan_embedded_security_feature_profile.n110.id
}
