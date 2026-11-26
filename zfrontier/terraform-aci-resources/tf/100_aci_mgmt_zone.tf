# 100 · resource aci_mgmt_zone · 1. System and fabric setup
# Manages ACI Management Zone
# APIC class: not collected · DN: not collected
# Reads models/aci_mgmt_zone.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_100 = yamldecode(file("${path.module}/../models/aci_mgmt_zone.yml"))["aci_mgmt_zone"]
}

resource "aci_mgmt_zone" "n100" {
  annotation                         = local.m_100["annotation"]
  description                        = local.m_100["description"]
  managed_node_connectivity_group_dn = local.m_100["managed_node_connectivity_group_dn"]
  name                               = local.m_100["name"]
  name_alias                         = local.m_100["name_alias"]
  relation_mgmt_rs_addr_inst         = local.m_100["relation_mgmt_rs_addr_inst"]
  relation_mgmt_rs_in_b              = local.m_100["relation_mgmt_rs_in_b"]
  relation_mgmt_rs_inb_epg           = local.m_100["relation_mgmt_rs_inb_epg"]
  relation_mgmt_rs_oo_b              = local.m_100["relation_mgmt_rs_oo_b"]
  relation_mgmt_rs_oob_epg           = local.m_100["relation_mgmt_rs_oob_epg"]
  type                               = local.m_100["type"]
}
