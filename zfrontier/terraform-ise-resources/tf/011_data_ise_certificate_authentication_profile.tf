# 011 · data source ise_certificate_authentication_profile · 2. Identity management
# This data source can read the Certificate Authentication Profile.
# Reads models/data_ise_certificate_authentication_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_011 = yamldecode(file("${path.module}/../models/data_ise_certificate_authentication_profile.yml"))["data_ise_certificate_authentication_profile"]
}

data "ise_certificate_authentication_profile" "n011" {
  id   = local.m_011["id"]
  name = local.m_011["name"]
}

output "n011_data_ise_certificate_authentication_profile_id" {
  value = data.ise_certificate_authentication_profile.n011.id
}
