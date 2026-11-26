# 325 · resource aci_igmp_snooping_policy · 3. Tenant and networking
# Manages ACI IGMP Snooping Policy
# APIC class: igmpSnoopPol · DN: uni/fabric/snPol-{name} | uni/tn-{name}/snPol-{name}
# Reads models/aci_igmp_snooping_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_325 = yamldecode(file("${path.module}/../models/aci_igmp_snooping_policy.yml"))["aci_igmp_snooping_policy"]
}

resource "aci_igmp_snooping_policy" "n325" {
  admin_state          = local.m_325["admin_state"]
  annotation           = local.m_325["annotation"]
  annotations          = local.m_325["annotations"]
  control              = local.m_325["control"]
  description          = local.m_325["description"]
  last_member_interval = local.m_325["last_member_interval"]
  name                 = local.m_325["name"]
  name_alias           = local.m_325["name_alias"]
  owner_key            = local.m_325["owner_key"]
  owner_tag            = local.m_325["owner_tag"]
  parent_dn            = local.m_325["parent_dn"]
  querier_version      = local.m_325["querier_version"]
  query_interval       = local.m_325["query_interval"]
  response_interval    = local.m_325["response_interval"]
  start_query_count    = local.m_325["start_query_count"]
  start_query_interval = local.m_325["start_query_interval"]
  tags                 = local.m_325["tags"]
}
