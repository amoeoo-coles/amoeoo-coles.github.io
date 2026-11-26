# 511 · resource sdwan_activate_centralized_policy · 13. (Classic) localized, centralized and security policies
# This resource can activate a centralized policy.
# Reads models/sdwan_activate_centralized_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_511 = yamldecode(file("${path.module}/../models/sdwan_activate_centralized_policy.yml"))["sdwan_activate_centralized_policy"]
}

resource "sdwan_activate_centralized_policy" "n511" {
  id = local.m_511["id"]
  version = local.m_511["version"]
}
