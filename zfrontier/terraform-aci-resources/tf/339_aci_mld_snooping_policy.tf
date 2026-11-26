# 339 · resource aci_mld_snooping_policy · 3. Tenant and networking
# Manages ACI MLD Snooping Policy
# APIC class: mldSnoopPol · DN: uni/fabric/mldsnoopPol-{name} | uni/tn-{name}/mldsnoopPol-{name}
# Reads models/aci_mld_snooping_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_339 = yamldecode(file("${path.module}/../models/aci_mld_snooping_policy.yml"))["aci_mld_snooping_policy"]
}

resource "aci_mld_snooping_policy" "n339" {
  admin_state          = local.m_339["admin_state"]
  annotation           = local.m_339["annotation"]
  annotations          = local.m_339["annotations"]
  control              = local.m_339["control"]
  description          = local.m_339["description"]
  last_member_interval = local.m_339["last_member_interval"]
  name                 = local.m_339["name"]
  name_alias           = local.m_339["name_alias"]
  owner_key            = local.m_339["owner_key"]
  owner_tag            = local.m_339["owner_tag"]
  parent_dn            = local.m_339["parent_dn"]
  query_interval       = local.m_339["query_interval"]
  response_interval    = local.m_339["response_interval"]
  start_query_count    = local.m_339["start_query_count"]
  start_query_interval = local.m_339["start_query_interval"]
  tags                 = local.m_339["tags"]
  version              = local.m_339["version"]
}
