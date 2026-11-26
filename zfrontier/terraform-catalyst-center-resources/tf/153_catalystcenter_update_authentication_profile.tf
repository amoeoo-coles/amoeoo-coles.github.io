# 153 · resource catalystcenter_update_authentication_profile · 7. SD-Access
# Updates an Authentication Profile. The No Authentication profile cannot be updated.
# Reads models/catalystcenter_update_authentication_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_153 = yamldecode(file("${path.module}/../models/catalystcenter_update_authentication_profile.yml"))["catalystcenter_update_authentication_profile"]
}

resource "catalystcenter_update_authentication_profile" "n153" {
  authentication_order = local.m_153["authentication_order"]
  authentication_profile_name = local.m_153["authentication_profile_name"]
  dot1x_to_mab_fallback_timeout = local.m_153["dot1x_to_mab_fallback_timeout"]
  fabric_id = local.m_153["fabric_id"]
  is_bpdu_guard_enabled = local.m_153["is_bpdu_guard_enabled"]
  number_of_hosts = local.m_153["number_of_hosts"]
  pre_auth_acl_access_contracts = local.m_153["pre_auth_acl_access_contracts"]
  pre_auth_acl_description = local.m_153["pre_auth_acl_description"]
  pre_auth_acl_enabled = local.m_153["pre_auth_acl_enabled"]
  pre_auth_acl_implicit_action = local.m_153["pre_auth_acl_implicit_action"]
  wake_on_lan = local.m_153["wake_on_lan"]
}
