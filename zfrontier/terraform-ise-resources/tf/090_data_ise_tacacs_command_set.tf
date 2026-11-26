# 090 · data source ise_tacacs_command_set · 6. Device administration
# This data source can read the TACACS Command Set.
# Reads models/data_ise_tacacs_command_set.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_090 = yamldecode(file("${path.module}/../models/data_ise_tacacs_command_set.yml"))["data_ise_tacacs_command_set"]
}

data "ise_tacacs_command_set" "n090" {
  id   = local.m_090["id"]
  name = local.m_090["name"]
}

output "n090_data_ise_tacacs_command_set_id" {
  value = data.ise_tacacs_command_set.n090.id
}
