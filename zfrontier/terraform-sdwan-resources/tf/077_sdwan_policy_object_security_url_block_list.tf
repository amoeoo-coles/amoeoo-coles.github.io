# 077 · resource sdwan_policy_object_security_url_block_list · 3. Policy objects and custom applications
# This resource can manage a Policy Object Security URL Block List Policy_object. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_security_url_block_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_077 = yamldecode(file("${path.module}/../models/sdwan_policy_object_security_url_block_list.yml"))["sdwan_policy_object_security_url_block_list"]
}

resource "sdwan_policy_object_security_url_block_list" "n077" {
  description = local.m_077["description"]
  entries = local.m_077["entries"]
  feature_profile_id = local.m_077["feature_profile_id"]
  name = local.m_077["name"]
}
