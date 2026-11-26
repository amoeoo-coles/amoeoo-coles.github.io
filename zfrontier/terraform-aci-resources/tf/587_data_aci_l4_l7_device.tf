# 587 · data source aci_l4_l7_device · 5. L4-L7 service graphs
# Data source for ACI L4-L7 Device
# APIC class: not collected · DN: not collected
# Reads models/data_aci_l4_l7_device.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_587 = yamldecode(file("${path.module}/../models/data_aci_l4_l7_device.yml"))["data_aci_l4_l7_device"]
}

data "aci_l4_l7_device" "n587" {
  active                               = local.m_587["active"]
  annotation                           = local.m_587["annotation"]
  context_aware                        = local.m_587["context_aware"]
  description                          = local.m_587["description"]
  device_type                          = local.m_587["device_type"]
  function_type                        = local.m_587["function_type"]
  is_copy                              = local.m_587["is_copy"]
  managed                              = local.m_587["managed"]
  mode                                 = local.m_587["mode"]
  name                                 = local.m_587["name"]
  name_alias                           = local.m_587["name_alias"]
  promiscuous_mode                     = local.m_587["promiscuous_mode"]
  relation_vns_rs_al_dev_to_phys_dom_p = local.m_587["relation_vns_rs_al_dev_to_phys_dom_p"]
  service_type                         = local.m_587["service_type"]
  tenant_dn                            = local.m_587["tenant_dn"]
  trunking                             = local.m_587["trunking"]
  dynamic "relation_vns_rs_al_dev_to_dom_p" {
    for_each = local.m_587["relation_vns_rs_al_dev_to_dom_p"] == null ? [] : local.m_587["relation_vns_rs_al_dev_to_dom_p"]
    content {
      domain_dn      = lookup(relation_vns_rs_al_dev_to_dom_p.value, "domain_dn", null)
      switching_mode = lookup(relation_vns_rs_al_dev_to_dom_p.value, "switching_mode", null)
    }
  }
}

output "n587_data_aci_l4_l7_device_id" {
  value = data.aci_l4_l7_device.n587.id
}
