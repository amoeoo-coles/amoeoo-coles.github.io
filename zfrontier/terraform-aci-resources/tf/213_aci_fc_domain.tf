# 213 · resource aci_fc_domain · 2. Access policies
# Manages ACI FC Domain
# APIC class: not collected · DN: not collected
# Reads models/aci_fc_domain.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_213 = yamldecode(file("${path.module}/../models/aci_fc_domain.yml"))["aci_fc_domain"]
}

resource "aci_fc_domain" "n213" {
  annotation                         = local.m_213["annotation"]
  name                               = local.m_213["name"]
  name_alias                         = local.m_213["name_alias"]
  relation_fc_rs_vsan_attr           = local.m_213["relation_fc_rs_vsan_attr"]
  relation_fc_rs_vsan_attr_def       = local.m_213["relation_fc_rs_vsan_attr_def"]
  relation_fc_rs_vsan_ns             = local.m_213["relation_fc_rs_vsan_ns"]
  relation_fc_rs_vsan_ns_def         = local.m_213["relation_fc_rs_vsan_ns_def"]
  relation_infra_rs_dom_vxlan_ns_def = local.m_213["relation_infra_rs_dom_vxlan_ns_def"]
  relation_infra_rs_vip_addr_ns      = local.m_213["relation_infra_rs_vip_addr_ns"]
  relation_infra_rs_vlan_ns          = local.m_213["relation_infra_rs_vlan_ns"]
  relation_infra_rs_vlan_ns_def      = local.m_213["relation_infra_rs_vlan_ns_def"]
}
