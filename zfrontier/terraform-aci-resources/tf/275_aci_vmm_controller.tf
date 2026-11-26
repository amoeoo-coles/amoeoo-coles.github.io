# 275 · resource aci_vmm_controller · 2. Access policies
# Manages ACI VMM Controller
# APIC class: not collected · DN: not collected
# Reads models/aci_vmm_controller.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_275 = yamldecode(file("${path.module}/../models/aci_vmm_controller.yml"))["aci_vmm_controller"]
}

resource "aci_vmm_controller" "n275" {
  annotation                      = local.m_275["annotation"]
  dvs_version                     = local.m_275["dvs_version"]
  host_or_ip                      = local.m_275["host_or_ip"]
  inventory_trig_st               = local.m_275["inventory_trig_st"]
  mode                            = local.m_275["mode"]
  msft_config_err_msg             = local.m_275["msft_config_err_msg"]
  msft_config_issues              = local.m_275["msft_config_issues"]
  n1kv_stats_mode                 = local.m_275["n1kv_stats_mode"]
  name                            = local.m_275["name"]
  name_alias                      = local.m_275["name_alias"]
  port                            = local.m_275["port"]
  relation_vmm_rs_acc             = local.m_275["relation_vmm_rs_acc"]
  relation_vmm_rs_ctrlr_p_mon_pol = local.m_275["relation_vmm_rs_ctrlr_p_mon_pol"]
  relation_vmm_rs_mcast_addr_ns   = local.m_275["relation_vmm_rs_mcast_addr_ns"]
  relation_vmm_rs_mgmt_e_pg       = local.m_275["relation_vmm_rs_mgmt_e_pg"]
  relation_vmm_rs_to_ext_dev_mgr  = local.m_275["relation_vmm_rs_to_ext_dev_mgr"]
  relation_vmm_rs_vxlan_ns        = local.m_275["relation_vmm_rs_vxlan_ns"]
  relation_vmm_rs_vxlan_ns_def    = local.m_275["relation_vmm_rs_vxlan_ns_def"]
  root_cont_name                  = local.m_275["root_cont_name"]
  scope                           = local.m_275["scope"]
  seq_num                         = local.m_275["seq_num"]
  stats_mode                      = local.m_275["stats_mode"]
  vmm_domain_dn                   = local.m_275["vmm_domain_dn"]
  vxlan_depl_pref                 = local.m_275["vxlan_depl_pref"]
  dynamic "relation_vmm_rs_vmm_ctrlr_p" {
    for_each = local.m_275["relation_vmm_rs_vmm_ctrlr_p"] == null ? [] : local.m_275["relation_vmm_rs_vmm_ctrlr_p"]
    content {
      epg_depl_pref = lookup(relation_vmm_rs_vmm_ctrlr_p.value, "epg_depl_pref", null)
      target_dn     = lookup(relation_vmm_rs_vmm_ctrlr_p.value, "target_dn", null)
    }
  }
}
