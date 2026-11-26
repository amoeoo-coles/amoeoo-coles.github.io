# 524 · resource sdwan_traffic_data_policy_definition · 13. (Classic) localized, centralized and security policies
# This resource can manage a Traffic Data Policy Definition .
# Reads models/sdwan_traffic_data_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_524 = yamldecode(file("${path.module}/../models/sdwan_traffic_data_policy_definition.yml"))["sdwan_traffic_data_policy_definition"]
}

resource "sdwan_traffic_data_policy_definition" "n524" {
  default_action = local.m_524["default_action"]
  description    = local.m_524["description"]
  name           = local.m_524["name"]
  sequences      = local.m_524["sequences"]
}
