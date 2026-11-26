# 016 · resource ise_endpoint_identity_group · 2. Identity management
# This resource can manage an Endpoint Identity Group.
# Reads models/ise_endpoint_identity_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_016 = yamldecode(file("${path.module}/../models/ise_endpoint_identity_group.yml"))["ise_endpoint_identity_group"]
}

resource "ise_endpoint_identity_group" "n016" {
  description = local.m_016["description"]
  name = local.m_016["name"]
  parent_endpoint_identity_group_id = local.m_016["parent_endpoint_identity_group_id"]
  system_defined = local.m_016["system_defined"]
}
