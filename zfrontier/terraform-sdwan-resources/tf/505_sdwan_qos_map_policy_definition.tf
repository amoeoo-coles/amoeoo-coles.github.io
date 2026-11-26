# 505 · resource sdwan_qos_map_policy_definition · 13. (Classic) localized, centralized and security policies
# This resource can manage a QoS Map Policy Definition .
# Reads models/sdwan_qos_map_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_505 = yamldecode(file("${path.module}/../models/sdwan_qos_map_policy_definition.yml"))["sdwan_qos_map_policy_definition"]
}

resource "sdwan_qos_map_policy_definition" "n505" {
  description = local.m_505["description"]
  name = local.m_505["name"]
  qos_schedulers = local.m_505["qos_schedulers"]
}
