# 007 · resource ise_active_directory_join_domain_with_all_nodes · 2. Identity management
# This resource can manage an Active Directory Join Domain with All Nodes.
# Reads models/ise_active_directory_join_domain_with_all_nodes.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_007 = yamldecode(file("${path.module}/../models/ise_active_directory_join_domain_with_all_nodes.yml"))["ise_active_directory_join_domain_with_all_nodes"]
}

resource "ise_active_directory_join_domain_with_all_nodes" "n007" {
  additional_data = local.m_007["additional_data"]
  join_point_id = local.m_007["join_point_id"]
}
