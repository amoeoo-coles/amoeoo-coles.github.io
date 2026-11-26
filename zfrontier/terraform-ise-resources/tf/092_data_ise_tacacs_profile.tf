# 092 · data source ise_tacacs_profile · 6. Device administration
# This data source can read the TACACS Profile.
# Reads models/data_ise_tacacs_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_092 = yamldecode(file("${path.module}/../models/data_ise_tacacs_profile.yml"))["data_ise_tacacs_profile"]
}

data "ise_tacacs_profile" "n092" {
  id   = local.m_092["id"]
  name = local.m_092["name"]
}

output "n092_data_ise_tacacs_profile_id" {
  value = data.ise_tacacs_profile.n092.id
}
