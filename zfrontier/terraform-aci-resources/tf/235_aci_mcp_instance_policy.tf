# 235 · resource aci_mcp_instance_policy · 2. Access policies
# Manages ACI MCP Instance Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_mcp_instance_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_235 = yamldecode(file("${path.module}/../models/aci_mcp_instance_policy.yml"))["aci_mcp_instance_policy"]
}

resource "aci_mcp_instance_policy" "n235" {
  admin_st         = local.m_235["admin_st"]
  annotation       = local.m_235["annotation"]
  ctrl             = local.m_235["ctrl"]
  description      = local.m_235["description"]
  init_delay_time  = local.m_235["init_delay_time"]
  key              = local.m_235["key"]
  loop_detect_mult = local.m_235["loop_detect_mult"]
  loop_protect_act = local.m_235["loop_protect_act"]
  name_alias       = local.m_235["name_alias"]
  tx_freq          = local.m_235["tx_freq"]
  tx_freq_msec     = local.m_235["tx_freq_msec"]
}
