# 215 · resource aci_l2_domain · 2. Access policies
# Manages ACI L2 Domain
# APIC class: not collected · DN: not collected
# Reads models/aci_l2_domain.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_215 = yamldecode(file("${path.module}/../models/aci_l2_domain.yml"))["aci_l2_domain"]
}

resource "aci_l2_domain" "n215" {
  annotation                         = local.m_215["annotation"]
  name                               = local.m_215["name"]
  name_alias                         = local.m_215["name_alias"]
  relation_extnw_rs_out              = local.m_215["relation_extnw_rs_out"]
  relation_infra_rs_dom_vxlan_ns_def = local.m_215["relation_infra_rs_dom_vxlan_ns_def"]
  relation_infra_rs_vip_addr_ns      = local.m_215["relation_infra_rs_vip_addr_ns"]
  relation_infra_rs_vlan_ns          = local.m_215["relation_infra_rs_vlan_ns"]
  relation_infra_rs_vlan_ns_def      = local.m_215["relation_infra_rs_vlan_ns_def"]
}
