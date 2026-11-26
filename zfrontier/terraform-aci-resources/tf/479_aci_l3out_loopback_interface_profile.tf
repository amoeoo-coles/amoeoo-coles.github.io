# 479 · resource aci_l3out_loopback_interface_profile · 3. Tenant and networking
# Manages ACI L3out Loopback Interface Profile
# APIC class: not collected · DN: not collected
# Reads models/aci_l3out_loopback_interface_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_479 = yamldecode(file("${path.module}/../models/aci_l3out_loopback_interface_profile.yml"))["aci_l3out_loopback_interface_profile"]
}

resource "aci_l3out_loopback_interface_profile" "n479" {
  addr           = local.m_479["addr"]
  annotation     = local.m_479["annotation"]
  description    = local.m_479["description"]
  fabric_node_dn = local.m_479["fabric_node_dn"]
  name_alias     = local.m_479["name_alias"]
}
