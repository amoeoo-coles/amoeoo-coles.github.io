# 460 · data source aci_l3out_bgp_protocol_profile · 3. Tenant and networking
# Data source for ACI L3out BGP Protocol Profile
# APIC class: not collected · DN: not collected
# Reads models/data_aci_l3out_bgp_protocol_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_460 = yamldecode(file("${path.module}/../models/data_aci_l3out_bgp_protocol_profile.yml"))["data_aci_l3out_bgp_protocol_profile"]
}

data "aci_l3out_bgp_protocol_profile" "n460" {
  annotation              = local.m_460["annotation"]
  logical_node_profile_dn = local.m_460["logical_node_profile_dn"]
  name                    = local.m_460["name"]
  name_alias              = local.m_460["name_alias"]
}

output "n460_data_aci_l3out_bgp_protocol_profile_id" {
  value = data.aci_l3out_bgp_protocol_profile.n460.id
}
