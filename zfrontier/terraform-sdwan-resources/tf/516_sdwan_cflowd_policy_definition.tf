# 516 · resource sdwan_cflowd_policy_definition · 13. (Classic) localized, centralized and security policies
# This resource can manage a Cflowd Policy Definition .
# Reads models/sdwan_cflowd_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_516 = yamldecode(file("${path.module}/../models/sdwan_cflowd_policy_definition.yml"))["sdwan_cflowd_policy_definition"]
}

resource "sdwan_cflowd_policy_definition" "n516" {
  active_flow_timeout = local.m_516["active_flow_timeout"]
  collectors = local.m_516["collectors"]
  description = local.m_516["description"]
  flow_refresh = local.m_516["flow_refresh"]
  inactive_flow_timeout = local.m_516["inactive_flow_timeout"]
  name = local.m_516["name"]
  protocol = local.m_516["protocol"]
  remarked_dscp = local.m_516["remarked_dscp"]
  sampling_interval = local.m_516["sampling_interval"]
  tos = local.m_516["tos"]
}
