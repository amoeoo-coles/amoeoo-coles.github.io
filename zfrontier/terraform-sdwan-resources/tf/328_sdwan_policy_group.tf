# 328 · resource sdwan_policy_group · 9. Configuration, policy and topology groups
# This resource can manage a Policy Group . Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_328 = yamldecode(file("${path.module}/../models/sdwan_policy_group.yml"))["sdwan_policy_group"]
}

resource "sdwan_policy_group" "n328" {
  description = local.m_328["description"]
  feature_profile_ids = local.m_328["feature_profile_ids"]
  name = local.m_328["name"]
  policy_versions = local.m_328["policy_versions"]
  solution = local.m_328["solution"]
}
