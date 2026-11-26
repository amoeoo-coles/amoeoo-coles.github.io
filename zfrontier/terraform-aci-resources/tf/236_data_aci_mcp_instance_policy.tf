# 236 · data source aci_mcp_instance_policy · 2. Access policies
# Data source for ACI MCP Instance Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_mcp_instance_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_236 = yamldecode(file("${path.module}/../models/data_aci_mcp_instance_policy.yml"))["data_aci_mcp_instance_policy"]
}

data "aci_mcp_instance_policy" "n236" {
  admin_st         = local.m_236["admin_st"]
  annotation       = local.m_236["annotation"]
  ctrl             = local.m_236["ctrl"]
  description      = local.m_236["description"]
  init_delay_time  = local.m_236["init_delay_time"]
  key              = local.m_236["key"]
  loop_detect_mult = local.m_236["loop_detect_mult"]
  loop_protect_act = local.m_236["loop_protect_act"]
  name_alias       = local.m_236["name_alias"]
  tx_freq          = local.m_236["tx_freq"]
  tx_freq_msec     = local.m_236["tx_freq_msec"]
}

output "n236_data_aci_mcp_instance_policy_id" {
  value = data.aci_mcp_instance_policy.n236.id
}
