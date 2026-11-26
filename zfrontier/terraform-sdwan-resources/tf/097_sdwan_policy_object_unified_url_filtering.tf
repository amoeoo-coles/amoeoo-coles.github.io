# 097 · resource sdwan_policy_object_unified_url_filtering · 3. Policy objects and custom applications
# This resource can manage a Policy Object Unified URL Filtering Policy_object. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_unified_url_filtering.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_097 = yamldecode(file("${path.module}/../models/sdwan_policy_object_unified_url_filtering.yml"))["sdwan_policy_object_unified_url_filtering"]
}

resource "sdwan_policy_object_unified_url_filtering" "n097" {
  alerts = local.m_097["alerts"]
  block_page_action = local.m_097["block_page_action"]
  block_page_contents = local.m_097["block_page_contents"]
  description = local.m_097["description"]
  enable_alerts = local.m_097["enable_alerts"]
  feature_profile_id = local.m_097["feature_profile_id"]
  name = local.m_097["name"]
  redirect_url = local.m_097["redirect_url"]
  url_allow_list_id = local.m_097["url_allow_list_id"]
  url_block_list_id = local.m_097["url_block_list_id"]
  web_categories = local.m_097["web_categories"]
  web_categories_action = local.m_097["web_categories_action"]
  web_reputation = local.m_097["web_reputation"]
}
