# 586 · resource aci_l4_l7_device · 5. L4-L7 service graphs
# Manages ACI L4-L7 Device
# APIC class: not collected · DN: not collected
# Reads models/aci_l4_l7_device.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_586 = yamldecode(file("${path.module}/../models/aci_l4_l7_device.yml"))["aci_l4_l7_device"]
}

resource "aci_l4_l7_device" "n586" {
  active                               = local.m_586["active"]
  annotation                           = local.m_586["annotation"]
  context_aware                        = local.m_586["context_aware"]
  description                          = local.m_586["description"]
  device_type                          = local.m_586["device_type"]
  function_type                        = local.m_586["function_type"]
  is_copy                              = local.m_586["is_copy"]
  managed                              = local.m_586["managed"]
  mode                                 = local.m_586["mode"]
  name                                 = local.m_586["name"]
  name_alias                           = local.m_586["name_alias"]
  promiscuous_mode                     = local.m_586["promiscuous_mode"]
  relation_vns_rs_al_dev_to_phys_dom_p = local.m_586["relation_vns_rs_al_dev_to_phys_dom_p"]
  service_type                         = local.m_586["service_type"]
  tenant_dn                            = local.m_586["tenant_dn"]
  trunking                             = local.m_586["trunking"]
  dynamic "relation_vns_rs_al_dev_to_dom_p" {
    for_each = local.m_586["relation_vns_rs_al_dev_to_dom_p"] == null ? [] : local.m_586["relation_vns_rs_al_dev_to_dom_p"]
    content {
      domain_dn      = lookup(relation_vns_rs_al_dev_to_dom_p.value, "domain_dn", null)
      switching_mode = lookup(relation_vns_rs_al_dev_to_dom_p.value, "switching_mode", null)
    }
  }
}
