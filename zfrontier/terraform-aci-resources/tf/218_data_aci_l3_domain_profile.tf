# 218 · data source aci_l3_domain_profile · 2. Access policies
# Data source for ACI L3 Domain Profile
# APIC class: not collected · DN: not collected
# Reads models/data_aci_l3_domain_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_218 = yamldecode(file("${path.module}/../models/data_aci_l3_domain_profile.yml"))["data_aci_l3_domain_profile"]
}

data "aci_l3_domain_profile" "n218" {
  annotation                         = local.m_218["annotation"]
  name                               = local.m_218["name"]
  name_alias                         = local.m_218["name_alias"]
  relation_extnw_rs_out              = local.m_218["relation_extnw_rs_out"]
  relation_infra_rs_dom_vxlan_ns_def = local.m_218["relation_infra_rs_dom_vxlan_ns_def"]
  relation_infra_rs_vip_addr_ns      = local.m_218["relation_infra_rs_vip_addr_ns"]
  relation_infra_rs_vlan_ns          = local.m_218["relation_infra_rs_vlan_ns"]
  relation_infra_rs_vlan_ns_def      = local.m_218["relation_infra_rs_vlan_ns_def"]
}

output "n218_data_aci_l3_domain_profile_id" {
  value = data.aci_l3_domain_profile.n218.id
}
