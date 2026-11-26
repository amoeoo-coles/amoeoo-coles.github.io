# 173 · resource aci_slow_drain_interface_policy · 2. Access policies
# Manages ACI Slow Drain Interface Policy
# APIC class: qosSdIfPol · DN: uni/infra/qossdpol-{name}
# Reads models/aci_slow_drain_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_173 = yamldecode(file("${path.module}/../models/aci_slow_drain_interface_policy.yml"))["aci_slow_drain_interface_policy"]
}

resource "aci_slow_drain_interface_policy" "n173" {
  annotation                   = local.m_173["annotation"]
  annotations                  = local.m_173["annotations"]
  congestion_clear_action      = local.m_173["congestion_clear_action"]
  congestion_detect_multiplier = local.m_173["congestion_detect_multiplier"]
  description                  = local.m_173["description"]
  flush_admin_state            = local.m_173["flush_admin_state"]
  flush_timeout                = local.m_173["flush_timeout"]
  name                         = local.m_173["name"]
  name_alias                   = local.m_173["name_alias"]
  owner_key                    = local.m_173["owner_key"]
  owner_tag                    = local.m_173["owner_tag"]
  tags                         = local.m_173["tags"]
}
