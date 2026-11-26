# 200 · data source aci_vlan_encapsulationfor_vxlan_traffic · 2. Access policies
# Data source for ACI Vlan Encapsulation for Vxlan Traffic
# APIC class: not collected · DN: not collected
# Reads models/data_aci_vlan_encapsulationfor_vxlan_traffic.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_200 = yamldecode(file("${path.module}/../models/data_aci_vlan_encapsulationfor_vxlan_traffic.yml"))["data_aci_vlan_encapsulationfor_vxlan_traffic"]
}

data "aci_vlan_encapsulationfor_vxlan_traffic" "n200" {
  annotation                          = local.m_200["annotation"]
  attachable_access_entity_profile_dn = local.m_200["attachable_access_entity_profile_dn"]
  description                         = local.m_200["description"]
  name_alias                          = local.m_200["name_alias"]
}

output "n200_data_aci_vlan_encapsulationfor_vxlan_traffic_id" {
  value = data.aci_vlan_encapsulationfor_vxlan_traffic.n200.id
}
