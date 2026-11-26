# 699 · resource aci_interface_fc_policy · 9. Other
# not collected
# APIC class: not collected · DN: not collected
# Reads models/aci_interface_fc_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_699 = yamldecode(file("${path.module}/../models/aci_interface_fc_policy.yml"))["aci_interface_fc_policy"]
}

resource "aci_interface_fc_policy" "n699" {
  annotation   = local.m_699["annotation"]
  automaxspeed = local.m_699["automaxspeed"]
  description  = local.m_699["description"]
  fill_pattern = local.m_699["fill_pattern"]
  name         = local.m_699["name"]
  name_alias   = local.m_699["name_alias"]
  port_mode    = local.m_699["port_mode"]
  rx_bb_credit = local.m_699["rx_bb_credit"]
  speed        = local.m_699["speed"]
  trunk_mode   = local.m_699["trunk_mode"]
}
