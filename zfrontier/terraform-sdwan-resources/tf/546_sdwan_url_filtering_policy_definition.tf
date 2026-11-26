# 546 · resource sdwan_url_filtering_policy_definition · 13. (Classic) localized, centralized and security policies
# This resource can manage a URL Filtering Policy Definition .
# Reads models/sdwan_url_filtering_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_546 = yamldecode(file("${path.module}/../models/sdwan_url_filtering_policy_definition.yml"))["sdwan_url_filtering_policy_definition"]
}

resource "sdwan_url_filtering_policy_definition" "n546" {
  alerts                 = local.m_546["alerts"]
  allow_url_list_id      = local.m_546["allow_url_list_id"]
  allow_url_list_version = local.m_546["allow_url_list_version"]
  block_page_action      = local.m_546["block_page_action"]
  block_page_contents    = local.m_546["block_page_contents"]
  block_url_list_id      = local.m_546["block_url_list_id"]
  block_url_list_version = local.m_546["block_url_list_version"]
  description            = local.m_546["description"]
  logging                = local.m_546["logging"]
  mode                   = local.m_546["mode"]
  name                   = local.m_546["name"]
  target_vpns            = local.m_546["target_vpns"]
  web_categories         = local.m_546["web_categories"]
  web_categories_action  = local.m_546["web_categories_action"]
  web_reputation         = local.m_546["web_reputation"]
}
