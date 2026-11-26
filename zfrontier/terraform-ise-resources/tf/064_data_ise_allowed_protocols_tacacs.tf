# 064 · data source ise_allowed_protocols_tacacs · 6. Device administration
# This data source can read a TACACS allowed protocols policy element.
# Reads models/data_ise_allowed_protocols_tacacs.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_064 = yamldecode(file("${path.module}/../models/data_ise_allowed_protocols_tacacs.yml"))["data_ise_allowed_protocols_tacacs"]
}

data "ise_allowed_protocols_tacacs" "n064" {
  id   = local.m_064["id"]
  name = local.m_064["name"]
}

output "n064_data_ise_allowed_protocols_tacacs_id" {
  value = data.ise_allowed_protocols_tacacs.n064.id
}
