# 108 · data source sdwan_dns_security_feature_profile · 4. Feature profiles
# This data source can read the DNS Security Feature Profile .
# Reads models/data_sdwan_dns_security_feature_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_108 = yamldecode(file("${path.module}/../models/data_sdwan_dns_security_feature_profile.yml"))["data_sdwan_dns_security_feature_profile"]
}

data "sdwan_dns_security_feature_profile" "n108" {
  id   = local.m_108["id"]
  name = local.m_108["name"]
}

output "n108_data_sdwan_dns_security_feature_profile_id" {
  value = data.sdwan_dns_security_feature_profile.n108.id
}
