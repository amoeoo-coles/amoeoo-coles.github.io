# 402 · resource aci_bd_dhcp_label · 3. Tenant and networking
# Manages ACI BD DHCP Label
# APIC class: not collected · DN: not collected
# Reads models/aci_bd_dhcp_label.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_402 = yamldecode(file("${path.module}/../models/aci_bd_dhcp_label.yml"))["aci_bd_dhcp_label"]
}

resource "aci_bd_dhcp_label" "n402" {
  annotation                       = local.m_402["annotation"]
  bridge_domain_dn                 = local.m_402["bridge_domain_dn"]
  description                      = local.m_402["description"]
  name                             = local.m_402["name"]
  name_alias                       = local.m_402["name_alias"]
  owner                            = local.m_402["owner"]
  relation_dhcp_rs_dhcp_option_pol = local.m_402["relation_dhcp_rs_dhcp_option_pol"]
  tag                              = local.m_402["tag"]
}
