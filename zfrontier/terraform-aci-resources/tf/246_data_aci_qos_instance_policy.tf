# 246 · data source aci_qos_instance_policy · 2. Access policies
# Data source for ACI QOS Instance Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_qos_instance_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_246 = yamldecode(file("${path.module}/../models/data_aci_qos_instance_policy.yml"))["data_aci_qos_instance_policy"]
}

data "aci_qos_instance_policy" "n246" {
  annotation            = local.m_246["annotation"]
  ctrl                  = local.m_246["ctrl"]
  description           = local.m_246["description"]
  etrap_age_timer       = local.m_246["etrap_age_timer"]
  etrap_bw_thresh       = local.m_246["etrap_bw_thresh"]
  etrap_byte_ct         = local.m_246["etrap_byte_ct"]
  etrap_st              = local.m_246["etrap_st"]
  fabric_flush_interval = local.m_246["fabric_flush_interval"]
  fabric_flush_st       = local.m_246["fabric_flush_st"]
  name_alias            = local.m_246["name_alias"]
  uburst_spine_queues   = local.m_246["uburst_spine_queues"]
  uburst_tor_queues     = local.m_246["uburst_tor_queues"]
}

output "n246_data_aci_qos_instance_policy_id" {
  value = data.aci_qos_instance_policy.n246.id
}
