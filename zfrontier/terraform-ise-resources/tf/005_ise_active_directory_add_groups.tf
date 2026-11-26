# 005 · resource ise_active_directory_add_groups · 2. Identity management
# This resource can manage an Active Directory Add Groups.
# Reads models/ise_active_directory_add_groups.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_005 = yamldecode(file("${path.module}/../models/ise_active_directory_add_groups.yml"))["ise_active_directory_add_groups"]
}

resource "ise_active_directory_add_groups" "n005" {
  ad_scopes_names            = local.m_005["ad_scopes_names"]
  description                = local.m_005["description"]
  domain                     = local.m_005["domain"]
  enable_domain_allowed_list = local.m_005["enable_domain_allowed_list"]
  groups                     = local.m_005["groups"]
  join_point_id              = local.m_005["join_point_id"]
  name                       = local.m_005["name"]
}
