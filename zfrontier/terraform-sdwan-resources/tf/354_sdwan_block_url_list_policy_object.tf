# 354 · resource sdwan_block_url_list_policy_object · 10. (Classic) policy objects
# This resource can manage a Block URL List Policy Object .
# Reads models/sdwan_block_url_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_354 = yamldecode(file("${path.module}/../models/sdwan_block_url_list_policy_object.yml"))["sdwan_block_url_list_policy_object"]
}

resource "sdwan_block_url_list_policy_object" "n354" {
  entries = local.m_354["entries"]
  name    = local.m_354["name"]
}
