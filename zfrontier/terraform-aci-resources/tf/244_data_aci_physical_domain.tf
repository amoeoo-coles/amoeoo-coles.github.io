# 244 · data source aci_physical_domain · 2. Access policies
# Data source for ACI Physical Domain
# APIC class: not collected · DN: not collected
# Reads models/data_aci_physical_domain.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_244 = yamldecode(file("${path.module}/../models/data_aci_physical_domain.yml"))["data_aci_physical_domain"]
}

data "aci_physical_domain" "n244" {
  annotation                         = local.m_244["annotation"]
  description                        = local.m_244["description"]
  name                               = local.m_244["name"]
  name_alias                         = local.m_244["name_alias"]
  relation_infra_rs_dom_vxlan_ns_def = local.m_244["relation_infra_rs_dom_vxlan_ns_def"]
  relation_infra_rs_vip_addr_ns      = local.m_244["relation_infra_rs_vip_addr_ns"]
  relation_infra_rs_vlan_ns          = local.m_244["relation_infra_rs_vlan_ns"]
  relation_infra_rs_vlan_ns_def      = local.m_244["relation_infra_rs_vlan_ns_def"]
}

output "n244_data_aci_physical_domain_id" {
  value = data.aci_physical_domain.n244.id
}
