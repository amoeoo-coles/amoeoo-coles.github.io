# 480 · data source aci_l3out_loopback_interface_profile · 3. Tenant and networking
# Data source for ACI Loop Back Interface Profile
# APIC class: not collected · DN: not collected
# Reads models/data_aci_l3out_loopback_interface_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_480 = yamldecode(file("${path.module}/../models/data_aci_l3out_loopback_interface_profile.yml"))["data_aci_l3out_loopback_interface_profile"]
}

data "aci_l3out_loopback_interface_profile" "n480" {
  addr           = local.m_480["addr"]
  annotation     = local.m_480["annotation"]
  description    = local.m_480["description"]
  fabric_node_dn = local.m_480["fabric_node_dn"]
  name_alias     = local.m_480["name_alias"]
}

output "n480_data_aci_l3out_loopback_interface_profile_id" {
  value = data.aci_l3out_loopback_interface_profile.n480.id
}
