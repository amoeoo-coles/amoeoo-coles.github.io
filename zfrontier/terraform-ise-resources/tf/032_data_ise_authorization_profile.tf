# 032 · data source ise_authorization_profile · 5. Network access
# This data source can read an authorization profiles policy element.
# Reads models/data_ise_authorization_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_032 = yamldecode(file("${path.module}/../models/data_ise_authorization_profile.yml"))["data_ise_authorization_profile"]
}

data "ise_authorization_profile" "n032" {
  id = local.m_032["id"]
  name = local.m_032["name"]
}

output "n032_data_ise_authorization_profile_id" {
  value = data.ise_authorization_profile.n032.id
}
