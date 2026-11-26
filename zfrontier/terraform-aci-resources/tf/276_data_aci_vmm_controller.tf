# 276 · data source aci_vmm_controller · 2. Access policies
# Data source for ACI VMM Controller
# APIC class: not collected · DN: not collected
# Reads models/data_aci_vmm_controller.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_276 = yamldecode(file("${path.module}/../models/data_aci_vmm_controller.yml"))["data_aci_vmm_controller"]
}

data "aci_vmm_controller" "n276" {
  annotation          = local.m_276["annotation"]
  description         = local.m_276["description"]
  dvs_version         = local.m_276["dvs_version"]
  host_or_ip          = local.m_276["host_or_ip"]
  inventory_trig_st   = local.m_276["inventory_trig_st"]
  mode                = local.m_276["mode"]
  msft_config_err_msg = local.m_276["msft_config_err_msg"]
  msft_config_issues  = local.m_276["msft_config_issues"]
  n1kv_stats_mode     = local.m_276["n1kv_stats_mode"]
  name                = local.m_276["name"]
  name_alias          = local.m_276["name_alias"]
  port                = local.m_276["port"]
  root_cont_name      = local.m_276["root_cont_name"]
  scope               = local.m_276["scope"]
  seq_num             = local.m_276["seq_num"]
  stats_mode          = local.m_276["stats_mode"]
  vmm_domain_dn       = local.m_276["vmm_domain_dn"]
  vxlan_depl_pref     = local.m_276["vxlan_depl_pref"]
}

output "n276_data_aci_vmm_controller_id" {
  value = data.aci_vmm_controller.n276.id
}
