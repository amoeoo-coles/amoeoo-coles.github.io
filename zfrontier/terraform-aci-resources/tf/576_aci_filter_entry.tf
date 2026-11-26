# 576 · resource aci_filter_entry · 4. Application
# Manages ACI Filter Entry
# APIC class: not collected · DN: not collected
# Reads models/aci_filter_entry.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_576 = yamldecode(file("${path.module}/../models/aci_filter_entry.yml"))["aci_filter_entry"]
}

resource "aci_filter_entry" "n576" {
  annotation    = local.m_576["annotation"]
  apply_to_frag = local.m_576["apply_to_frag"]
  arp_opc       = local.m_576["arp_opc"]
  d_from_port   = local.m_576["d_from_port"]
  d_to_port     = local.m_576["d_to_port"]
  description   = local.m_576["description"]
  ether_t       = local.m_576["ether_t"]
  filter_dn     = local.m_576["filter_dn"]
  icmpv4_t      = local.m_576["icmpv4_t"]
  icmpv6_t      = local.m_576["icmpv6_t"]
  match_dscp    = local.m_576["match_dscp"]
  name          = local.m_576["name"]
  name_alias    = local.m_576["name_alias"]
  prot          = local.m_576["prot"]
  s_from_port   = local.m_576["s_from_port"]
  s_to_port     = local.m_576["s_to_port"]
  stateful      = local.m_576["stateful"]
  tcp_rules     = local.m_576["tcp_rules"]
}
