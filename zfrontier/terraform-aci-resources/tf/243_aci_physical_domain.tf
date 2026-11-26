# 243 · resource aci_physical_domain · 2. Access policies
# Manages ACI Physical Domain
# APIC class: not collected · DN: not collected
# Reads models/aci_physical_domain.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_243 = yamldecode(file("${path.module}/../models/aci_physical_domain.yml"))["aci_physical_domain"]
}

resource "aci_physical_domain" "n243" {
  annotation                         = local.m_243["annotation"]
  name                               = local.m_243["name"]
  name_alias                         = local.m_243["name_alias"]
  relation_infra_rs_dom_vxlan_ns_def = local.m_243["relation_infra_rs_dom_vxlan_ns_def"]
  relation_infra_rs_vip_addr_ns      = local.m_243["relation_infra_rs_vip_addr_ns"]
  relation_infra_rs_vlan_ns          = local.m_243["relation_infra_rs_vlan_ns"]
  relation_infra_rs_vlan_ns_def      = local.m_243["relation_infra_rs_vlan_ns_def"]
}
