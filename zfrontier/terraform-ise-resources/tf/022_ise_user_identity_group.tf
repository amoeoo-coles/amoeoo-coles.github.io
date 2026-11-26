# 022 · resource ise_user_identity_group · 2. Identity management
# This resource can manage an User Identity Group.
# Reads models/ise_user_identity_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_022 = yamldecode(file("${path.module}/../models/ise_user_identity_group.yml"))["ise_user_identity_group"]
}

resource "ise_user_identity_group" "n022" {
  description = local.m_022["description"]
  name = local.m_022["name"]
  parent = local.m_022["parent"]
}
