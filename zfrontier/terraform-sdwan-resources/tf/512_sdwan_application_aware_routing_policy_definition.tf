# 512 · resource sdwan_application_aware_routing_policy_definition · 13. (Classic) localized, centralized and security policies
# This resource can manage a Application Aware Routing Policy Definition .
# Reads models/sdwan_application_aware_routing_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_512 = yamldecode(file("${path.module}/../models/sdwan_application_aware_routing_policy_definition.yml"))["sdwan_application_aware_routing_policy_definition"]
}

resource "sdwan_application_aware_routing_policy_definition" "n512" {
  default_action = local.m_512["default_action"]
  default_action_sla_class_list_id = local.m_512["default_action_sla_class_list_id"]
  default_action_sla_class_list_version = local.m_512["default_action_sla_class_list_version"]
  description = local.m_512["description"]
  name = local.m_512["name"]
  sequences = local.m_512["sequences"]
}
