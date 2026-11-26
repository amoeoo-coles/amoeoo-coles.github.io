# 286 · resource fmc_identity_policy · 3. Policies
# This resource manages Identity Policy with corresponding Categories and Rules. The following restrictions apply: Minimum FMC version: 7.2Minimum FMC version for object management (Create/Update/Delete): 10.0
# Reads models/fmc_identity_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_286 = yamldecode(file("${path.module}/../models/fmc_identity_policy.yml"))["fmc_identity_policy"]
}

resource "fmc_identity_policy" "n286" {
  active_authentication_maximum_login_attempts = local.m_286["active_authentication_maximum_login_attempts"]
  active_authentication_page = local.m_286["active_authentication_page"]
  active_authentication_page_html = local.m_286["active_authentication_page_html"]
  active_authentication_redirect_fqdn_id = local.m_286["active_authentication_redirect_fqdn_id"]
  active_authentication_redirect_fqdn_type = local.m_286["active_authentication_redirect_fqdn_type"]
  active_authentication_redirect_port = local.m_286["active_authentication_redirect_port"]
  active_authentication_server_certificate_id = local.m_286["active_authentication_server_certificate_id"]
  active_authentication_server_certificate_type = local.m_286["active_authentication_server_certificate_type"]
  active_authentication_session_sharing = local.m_286["active_authentication_session_sharing"]
  categories = local.m_286["categories"]
  description = local.m_286["description"]
  domain = local.m_286["domain"]
  identity_mapping_filter_network_object_id = local.m_286["identity_mapping_filter_network_object_id"]
  identity_mapping_filter_network_object_type = local.m_286["identity_mapping_filter_network_object_type"]
  name = local.m_286["name"]
  rules = local.m_286["rules"]
}
