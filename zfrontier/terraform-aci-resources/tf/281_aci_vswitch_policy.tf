# 281 · resource aci_vswitch_policy · 2. Access policies
# Manages ACI VSwitch Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_vswitch_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_281 = yamldecode(file("${path.module}/../models/aci_vswitch_policy.yml"))["aci_vswitch_policy"]
}

resource "aci_vswitch_policy" "n281" {
  annotation                                   = local.m_281["annotation"]
  description                                  = local.m_281["description"]
  name_alias                                   = local.m_281["name_alias"]
  relation_vmm_rs_vswitch_override_cdp_if_pol  = local.m_281["relation_vmm_rs_vswitch_override_cdp_if_pol"]
  relation_vmm_rs_vswitch_override_fw_pol      = local.m_281["relation_vmm_rs_vswitch_override_fw_pol"]
  relation_vmm_rs_vswitch_override_lacp_pol    = local.m_281["relation_vmm_rs_vswitch_override_lacp_pol"]
  relation_vmm_rs_vswitch_override_lldp_if_pol = local.m_281["relation_vmm_rs_vswitch_override_lldp_if_pol"]
  relation_vmm_rs_vswitch_override_mcp_if_pol  = local.m_281["relation_vmm_rs_vswitch_override_mcp_if_pol"]
  relation_vmm_rs_vswitch_override_mtu_pol     = local.m_281["relation_vmm_rs_vswitch_override_mtu_pol"]
  relation_vmm_rs_vswitch_override_stp_pol     = local.m_281["relation_vmm_rs_vswitch_override_stp_pol"]
  vmm_domain_dn                                = local.m_281["vmm_domain_dn"]
  dynamic "relation_vmm_rs_vswitch_exporter_pol" {
    for_each = local.m_281["relation_vmm_rs_vswitch_exporter_pol"] == null ? [] : local.m_281["relation_vmm_rs_vswitch_exporter_pol"]
    content {
      active_flow_time_out = lookup(relation_vmm_rs_vswitch_exporter_pol.value, "active_flow_time_out", null)
      idle_flow_time_out   = lookup(relation_vmm_rs_vswitch_exporter_pol.value, "idle_flow_time_out", null)
      sampling_rate        = lookup(relation_vmm_rs_vswitch_exporter_pol.value, "sampling_rate", null)
      target_dn            = lookup(relation_vmm_rs_vswitch_exporter_pol.value, "target_dn", null)
    }
  }
}
