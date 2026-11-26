# 700 · data source aci_interface_fc_policy · 9. Other
# not collected
# APIC class: not collected · DN: not collected
# Reads models/data_aci_interface_fc_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_700 = yamldecode(file("${path.module}/../models/data_aci_interface_fc_policy.yml"))["data_aci_interface_fc_policy"]
}

data "aci_interface_fc_policy" "n700" {
  annotation   = local.m_700["annotation"]
  automaxspeed = local.m_700["automaxspeed"]
  description  = local.m_700["description"]
  fill_pattern = local.m_700["fill_pattern"]
  name         = local.m_700["name"]
  name_alias   = local.m_700["name_alias"]
  port_mode    = local.m_700["port_mode"]
  rx_bb_credit = local.m_700["rx_bb_credit"]
  speed        = local.m_700["speed"]
  trunk_mode   = local.m_700["trunk_mode"]
}

output "n700_data_aci_interface_fc_policy_id" {
  value = data.aci_interface_fc_policy.n700.id
}
