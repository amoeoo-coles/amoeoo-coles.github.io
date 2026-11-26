# 577 · data source aci_filter_entry · 4. Application
# Data source for ACI Filter Entry
# APIC class: not collected · DN: not collected
# Reads models/data_aci_filter_entry.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_577 = yamldecode(file("${path.module}/../models/data_aci_filter_entry.yml"))["data_aci_filter_entry"]
}

data "aci_filter_entry" "n577" {
  annotation    = local.m_577["annotation"]
  apply_to_frag = local.m_577["apply_to_frag"]
  arp_opc       = local.m_577["arp_opc"]
  d_from_port   = local.m_577["d_from_port"]
  d_to_port     = local.m_577["d_to_port"]
  description   = local.m_577["description"]
  ether_t       = local.m_577["ether_t"]
  filter_dn     = local.m_577["filter_dn"]
  icmpv4_t      = local.m_577["icmpv4_t"]
  icmpv6_t      = local.m_577["icmpv6_t"]
  match_dscp    = local.m_577["match_dscp"]
  name          = local.m_577["name"]
  name_alias    = local.m_577["name_alias"]
  prot          = local.m_577["prot"]
  s_from_port   = local.m_577["s_from_port"]
  s_to_port     = local.m_577["s_to_port"]
  stateful      = local.m_577["stateful"]
  tcp_rules     = local.m_577["tcp_rules"]
}

output "n577_data_aci_filter_entry_id" {
  value = data.aci_filter_entry.n577.id
}
