# 166 · resource fmc_radius_server_group · 2. Objects
# This resource manages a Radius Server Group.
# Reads models/fmc_radius_server_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_166 = yamldecode(file("${path.module}/../models/fmc_radius_server_group.yml"))["fmc_radius_server_group"]
}

resource "fmc_radius_server_group" "n166" {
  ad_realm_id = local.m_166["ad_realm_id"]
  authorize_only = local.m_166["authorize_only"]
  description = local.m_166["description"]
  domain = local.m_166["domain"]
  dynamic_authorization = local.m_166["dynamic_authorization"]
  dynamic_authorization_port = local.m_166["dynamic_authorization_port"]
  group_accounting_mode = local.m_166["group_accounting_mode"]
  interim_account_update_interval = local.m_166["interim_account_update_interval"]
  merge_downloadable_access_list_order = local.m_166["merge_downloadable_access_list_order"]
  name = local.m_166["name"]
  radius_servers = local.m_166["radius_servers"]
  retry_interval = local.m_166["retry_interval"]
}
