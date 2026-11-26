# 444 · resource fmc_realm_ad_ldap · 6. Integrations
# This resource manages a Realm AD LDAP.
# Reads models/fmc_realm_ad_ldap.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_444 = yamldecode(file("${path.module}/../models/fmc_realm_ad_ldap.yml"))["fmc_realm_ad_ldap"]
}

resource "fmc_realm_ad_ldap" "n444" {
  ad_join_password = local.m_444["ad_join_password"]
  ad_join_username = local.m_444["ad_join_username"]
  ad_primary_domain = local.m_444["ad_primary_domain"]
  base_dn = local.m_444["base_dn"]
  description = local.m_444["description"]
  directory_password = try(var.secrets["fmc_realm_ad_ldap.directory_password"], local.m_444["directory_password"])
  directory_servers = local.m_444["directory_servers"]
  directory_username = local.m_444["directory_username"]
  domain = local.m_444["domain"]
  enabled = local.m_444["enabled"]
  excluded_groups = local.m_444["excluded_groups"]
  excluded_users = local.m_444["excluded_users"]
  group_attribute = local.m_444["group_attribute"]
  group_dn = local.m_444["group_dn"]
  included_groups = local.m_444["included_groups"]
  included_users = local.m_444["included_users"]
  name = local.m_444["name"]
  realm_type = local.m_444["realm_type"]
  timeout_captive_portal_users = local.m_444["timeout_captive_portal_users"]
  timeout_failed_captive_portal_users = local.m_444["timeout_failed_captive_portal_users"]
  timeout_guest_captive_portal_users = local.m_444["timeout_guest_captive_portal_users"]
  timeout_ise_and_passive_indentity_users = local.m_444["timeout_ise_and_passive_indentity_users"]
  timeout_terminal_server_agent_users = local.m_444["timeout_terminal_server_agent_users"]
  update_hour = local.m_444["update_hour"]
  update_interval = local.m_444["update_interval"]
}
