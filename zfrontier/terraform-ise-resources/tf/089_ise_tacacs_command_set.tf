# 089 · resource ise_tacacs_command_set · 6. Device administration
# This resource can manage a TACACS Command Set.
# Reads models/ise_tacacs_command_set.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_089 = yamldecode(file("${path.module}/../models/ise_tacacs_command_set.yml"))["ise_tacacs_command_set"]
}

resource "ise_tacacs_command_set" "n089" {
  commands = local.m_089["commands"]
  description = local.m_089["description"]
  name = local.m_089["name"]
  permit_unmatched = local.m_089["permit_unmatched"]
}
