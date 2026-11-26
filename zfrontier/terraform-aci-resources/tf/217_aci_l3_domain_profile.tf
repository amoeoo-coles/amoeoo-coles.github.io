# 217 · resource aci_l3_domain_profile · 2. Access policies
# Manages ACI L3 Domain Profile
# APIC class: not collected · DN: not collected
# Reads models/aci_l3_domain_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_217 = yamldecode(file("${path.module}/../models/aci_l3_domain_profile.yml"))["aci_l3_domain_profile"]
}

resource "aci_l3_domain_profile" "n217" {
  annotation                         = local.m_217["annotation"]
  name                               = local.m_217["name"]
  name_alias                         = local.m_217["name_alias"]
  relation_extnw_rs_out              = local.m_217["relation_extnw_rs_out"]
  relation_infra_rs_dom_vxlan_ns_def = local.m_217["relation_infra_rs_dom_vxlan_ns_def"]
  relation_infra_rs_vip_addr_ns      = local.m_217["relation_infra_rs_vip_addr_ns"]
  relation_infra_rs_vlan_ns          = local.m_217["relation_infra_rs_vlan_ns"]
  relation_infra_rs_vlan_ns_def      = local.m_217["relation_infra_rs_vlan_ns_def"]
}
