# 245 · resource aci_qos_instance_policy · 2. Access policies
# Manages ACI QOS Instance Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_qos_instance_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_245 = yamldecode(file("${path.module}/../models/aci_qos_instance_policy.yml"))["aci_qos_instance_policy"]
}

resource "aci_qos_instance_policy" "n245" {
  annotation            = local.m_245["annotation"]
  ctrl                  = local.m_245["ctrl"]
  description           = local.m_245["description"]
  etrap_age_timer       = local.m_245["etrap_age_timer"]
  etrap_bw_thresh       = local.m_245["etrap_bw_thresh"]
  etrap_byte_ct         = local.m_245["etrap_byte_ct"]
  etrap_st              = local.m_245["etrap_st"]
  fabric_flush_interval = local.m_245["fabric_flush_interval"]
  fabric_flush_st       = local.m_245["fabric_flush_st"]
  name_alias            = local.m_245["name_alias"]
  uburst_spine_queues   = local.m_245["uburst_spine_queues"]
  uburst_tor_queues     = local.m_245["uburst_tor_queues"]
}
