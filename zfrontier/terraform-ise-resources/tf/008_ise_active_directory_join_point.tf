# 008 · resource ise_active_directory_join_point · 2. Identity management
# This resource can manage an Active Directory Join Point.
# Reads models/ise_active_directory_join_point.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_008 = yamldecode(file("${path.module}/../models/ise_active_directory_join_point.yml"))["ise_active_directory_join_point"]
}

resource "ise_active_directory_join_point" "n008" {
  ad_scopes_names = local.m_008["ad_scopes_names"]
  aging_time = local.m_008["aging_time"]
  attributes = local.m_008["attributes"]
  auth_protection_type = local.m_008["auth_protection_type"]
  country = local.m_008["country"]
  department = local.m_008["department"]
  description = local.m_008["description"]
  domain = local.m_008["domain"]
  email = local.m_008["email"]
  enable_callback_for_dialin_client = local.m_008["enable_callback_for_dialin_client"]
  enable_dialin_permission_check = local.m_008["enable_dialin_permission_check"]
  enable_domain_allowed_list = local.m_008["enable_domain_allowed_list"]
  enable_failed_auth_protection = local.m_008["enable_failed_auth_protection"]
  enable_machine_access = local.m_008["enable_machine_access"]
  enable_machine_auth = local.m_008["enable_machine_auth"]
  enable_pass_change = local.m_008["enable_pass_change"]
  enable_rewrites = local.m_008["enable_rewrites"]
  failed_auth_threshold = local.m_008["failed_auth_threshold"]
  first_name = local.m_008["first_name"]
  groups = local.m_008["groups"]
  identity_not_in_ad_behaviour = local.m_008["identity_not_in_ad_behaviour"]
  job_title = local.m_008["job_title"]
  last_name = local.m_008["last_name"]
  locality = local.m_008["locality"]
  name = local.m_008["name"]
  organizational_unit = local.m_008["organizational_unit"]
  plaintext_auth = local.m_008["plaintext_auth"]
  rewrite_rules = local.m_008["rewrite_rules"]
  schema = local.m_008["schema"]
  state_or_province = local.m_008["state_or_province"]
  street_address = local.m_008["street_address"]
  telephone = local.m_008["telephone"]
  unreachable_domains_behaviour = local.m_008["unreachable_domains_behaviour"]
}
