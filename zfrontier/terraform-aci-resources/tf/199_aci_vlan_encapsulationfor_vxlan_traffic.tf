# 199 · resource aci_vlan_encapsulationfor_vxlan_traffic · 2. Access policies
# Manages ACI Vlan Encapsulation for Vxlan Traffic
# APIC class: not collected · DN: not collected
# Reads models/aci_vlan_encapsulationfor_vxlan_traffic.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_199 = yamldecode(file("${path.module}/../models/aci_vlan_encapsulationfor_vxlan_traffic.yml"))["aci_vlan_encapsulationfor_vxlan_traffic"]
}

resource "aci_vlan_encapsulationfor_vxlan_traffic" "n199" {
  annotation                          = local.m_199["annotation"]
  attachable_access_entity_profile_dn = local.m_199["attachable_access_entity_profile_dn"]
  description                         = local.m_199["description"]
  name_alias                          = local.m_199["name_alias"]
}
