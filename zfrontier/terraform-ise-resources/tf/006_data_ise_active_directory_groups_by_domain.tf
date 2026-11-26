# 006 · data source ise_active_directory_groups_by_domain · 2. Identity management
# This data source can read the Active Directory Groups By Domain.
# Reads models/data_ise_active_directory_groups_by_domain.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_006 = yamldecode(file("${path.module}/../models/data_ise_active_directory_groups_by_domain.yml"))["data_ise_active_directory_groups_by_domain"]
}

data "ise_active_directory_groups_by_domain" "n006" {
  domain        = local.m_006["domain"]
  filter        = local.m_006["filter"]
  join_point_id = local.m_006["join_point_id"]
  sid_filter    = local.m_006["sid_filter"]
  type_filter   = local.m_006["type_filter"]
}
