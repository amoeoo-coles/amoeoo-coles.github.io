# 514 · resource sdwan_centralized_policy · 13. (Classic) localized, centralized and security policies
# This resource can manage a Centralized Policy .
# Reads models/sdwan_centralized_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_514 = yamldecode(file("${path.module}/../models/sdwan_centralized_policy.yml"))["sdwan_centralized_policy"]
}

resource "sdwan_centralized_policy" "n514" {
  definitions = local.m_514["definitions"]
  description = local.m_514["description"]
  name        = local.m_514["name"]
}
