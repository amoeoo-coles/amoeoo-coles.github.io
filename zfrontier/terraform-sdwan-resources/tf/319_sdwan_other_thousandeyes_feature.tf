# 319 · resource sdwan_other_thousandeyes_feature · 8. Features: CLI, topology, SIG, SSE and other
# This resource can manage a Other ThousandEyes Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_other_thousandeyes_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_319 = yamldecode(file("${path.module}/../models/sdwan_other_thousandeyes_feature.yml"))["sdwan_other_thousandeyes_feature"]
}

resource "sdwan_other_thousandeyes_feature" "n319" {
  description         = local.m_319["description"]
  feature_profile_id  = local.m_319["feature_profile_id"]
  name                = local.m_319["name"]
  virtual_application = local.m_319["virtual_application"]
}
